import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService, {required HomeRemoteDataSourceImpl homeRemoteDataSource, required HomeLocalDataSourceImpl homeLocalDataSource});

  @override
  Future<Either<Failure, List<Book>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtring=free-ebooks&Sorting=newest &q=computer science",
      );

      List<Book> books = [];
      for (var item in data["items"]) {
        try {
          books.add(Book.fromNo(item));
        } catch (e) {
          books.add(Book.fromNo(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is Failure) {
        return left(ServerFailure.fromDioError(e as DioError));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtring=free-ebooks&q=Programming",
      );

      List<Book> books = [];
      for (var item in data["items"]) {
        books.add(Book.fromNo(item));
      }

      return right(books);
    } catch (e) {
      if (e is Failure) {
        return left(ServerFailure.fromDioError(e as DioError));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtring=free-ebooks&Sorting=relevance &q=subject:Programming",
      );

      List<Book> books = [];
      for (var item in data["items"]) {
        books.add(Book.fromNo(item));
      }

      return right(books);
    } catch (e) {
      if (e is Failure) {
        return left(ServerFailure.fromDioError(e as DioError));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<List<Book>> fetchSearchBooks(String query, dynamic apiService) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?q=$query&maxResults=40',
      );
      List<Book> books = [];
      if (data['items'] != null) {
        for (var item in data['items']) {
          books.add(Book.fromNo(item));
        }
      }
      return books;
    } catch (e) {
      throw e.toString();
    }
  }
}
