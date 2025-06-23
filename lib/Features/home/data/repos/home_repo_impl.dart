import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Book>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "volumes?Filtring=free-ebooks&Sorting=newest &q=subject:Programming",
      );

      List<Book> books = [];
      for (var item in data["items"]) {
        books.add(Book.fromJson(item));
      }

      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
