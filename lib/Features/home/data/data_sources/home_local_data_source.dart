import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fechFeaturedBooks();
  List<BookEntity> fechNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fechFeaturedBooks() {
    var box = Hive.box<BookEntity>(KFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fechNewestBooks() {
    // TODO: implement fechNewestBooks
    throw UnimplementedError();
  }
  
}