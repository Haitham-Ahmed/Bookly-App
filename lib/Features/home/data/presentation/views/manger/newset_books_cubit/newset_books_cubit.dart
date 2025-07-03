import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fech_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fechNewestBooksUseCase) : super(NewsetBooksInitial());

  final FechNewestBooksUseCase fechNewestBooksUseCase;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await fechNewestBooksUseCase.call();
    result.fold(
      (failure) {
        emit(NewsetBooksFailure(failure.errMessage));
      },
      (books) {
        emit(NewsetBooksSuccess(books));
      },
    );
  }
}
