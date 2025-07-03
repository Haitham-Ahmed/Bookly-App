import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/function/save_books.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsetBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: "volumes?Filtring=free-ebooks&q=subject:Programming");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, KFeaturedBox);
    return books;
  }

  

  @override
  Future<List<BookEntity>> fetchNewsetBooks() async {
    var data = await apiService.get(
      endPoint: "volumes?Filtring=free-ebooks&Sorting=newest &q=computer science");
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, KNewestBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data["items"]) {
      books.add(Book.fromNo(bookMap));
    }
    return books;
  }
}
