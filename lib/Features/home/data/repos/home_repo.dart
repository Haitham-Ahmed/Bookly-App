import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Book>>> fetchNewsetBooks();
  Future<Either<Failure, List<Book>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Book>>> fetchSimilarBooks({required String category});
  Future<List<Book>> fetchSearchBooks(String query, dynamic apiService);
}
