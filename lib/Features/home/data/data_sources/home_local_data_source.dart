import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fechFeaturedBooks();
  List<BookEntity> fechNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fechFeaturedBooks() {
    // TODO: implement fechFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fechNewestBooks() {
    // TODO: implement fechNewestBooks
    throw UnimplementedError();
  }
  
}