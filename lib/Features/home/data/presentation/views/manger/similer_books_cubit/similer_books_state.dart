part of 'similer_books_cubit.dart';

sealed class SimilerBooksCubitState extends Equatable {
  const SimilerBooksCubitState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksCubitInitial extends SimilerBooksCubitState {}

final class SimilerBooksCubitLoading extends SimilerBooksCubitState {}

final class SimilerBooksCubitSuccess extends SimilerBooksCubitState {
  final List<Book> books;
  const SimilerBooksCubitSuccess(this.books);
}

final class SimilerBooksCubitFailure extends SimilerBooksCubitState {
  final String errMessage;
  const SimilerBooksCubitFailure(this.errMessage);
}
