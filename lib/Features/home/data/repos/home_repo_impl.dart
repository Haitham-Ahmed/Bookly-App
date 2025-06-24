import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Book>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtring=free-ebooks&Sorting=newest &q=subject:computer science",
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
      return left(ServerFailure(e.toString(),),);
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtring=free-ebooks&q=subject:Programming",
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
      return left(ServerFailure(e.toString(),),);
    }
  }
  
  @override
  Future<Either<Failure, List<Book>>> fetchSimilarBooks({required String category}) async {
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
      return left(ServerFailure(e.toString(),),);
    }
  }
}
