part of 'featuerd_books_cubit.dart';

sealed class FeatuerdBookState extends Equatable {
  const FeatuerdBookState();

  @override
  List<Object> get props => [];
}

final class FeatuerdBookInitial extends FeatuerdBookState {}

final class FeatuerdBookLoading extends FeatuerdBookState {}

final class FeatuerdBookFailure extends FeatuerdBookState {
  final String errMessage;
  const FeatuerdBookFailure(this.errMessage);
}

final class FeatuerdBookSuccess extends FeatuerdBookState {
  final List<Book> books;
  const FeatuerdBookSuccess(this.books);
}


