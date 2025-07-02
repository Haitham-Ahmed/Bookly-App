import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class FechFeaturedBooksUseCases {
  final HomeRepo homeRepo;
  FechFeaturedBooksUseCases(this.homeRepo);
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks()
  {
    return homeRepo.fetchFeaturedBooks();
  }
}