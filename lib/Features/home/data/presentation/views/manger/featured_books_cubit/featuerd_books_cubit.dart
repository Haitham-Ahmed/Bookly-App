import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fech_featured_books_use_cases.dart';
import 'package:equatable/equatable.dart';

part 'featuerd_books_state.dart';

class FeatuerdBookCubit extends Cubit<FeatuerdBookState> {
  FeatuerdBookCubit(this.featuredBooksUseCase) : super(FeatuerdBookInitial());

  final FechFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatuerdBookLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((failure) {
      emit(FeatuerdBookFailure(failure.errMessage));
    }, (books) {
      emit(FeatuerdBookSuccess(books));
    });
  }
}
