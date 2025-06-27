part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Book> books;

  SearchSuccess(this.books);
}

class SearchEmpty extends SearchState {}

class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}