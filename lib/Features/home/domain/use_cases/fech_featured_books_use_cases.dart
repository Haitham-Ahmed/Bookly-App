import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FechFeaturedBooksUseCase extends UseCase<List<Book>, NoParam> {
  final HomeRepo homeRepo;
  FechFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<Book>>> call([NoParam? param]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}



