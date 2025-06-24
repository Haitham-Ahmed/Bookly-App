import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featuerd_books_state.dart';

class FeatuerdBookCubit extends Cubit<FeatuerdBookState> {
  FeatuerdBookCubit(this.homeRepo) : super(FeatuerdBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatuerdBookLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeatuerdBookFailure(failure.errMessage));
    }, (books) {
      emit(FeatuerdBookSuccess(books));
    });
  }
}
