import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';

abstract class HomeRepo {
  Future<List<Book>> fetchFeaturedBooks();
  Future<List<Book>> fetchNewsetBooks();
}