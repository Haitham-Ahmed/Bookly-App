import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';

abstract class HomeRemoteDataSource {
  Future<List<Book>> fetchFeaturedBooks();
  Future<List<Book>> fetchNewsetBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<Book>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> fetchNewsetBooks() {
    // TODO: implement fetchNewsetBooks
    throw UnimplementedError();
  }
}
