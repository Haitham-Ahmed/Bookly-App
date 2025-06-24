import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubitCubit extends Cubit<SimilerBooksCubitState> {
  SimilerBooksCubitCubit(this.homeRepo) : super(SimilerBooksCubitInitial());


  final HomeRepo homeRepo;

  Future<void> fetchSimilerBooks({required String category}) async {
    emit(SimilerBooksCubitLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(SimilerBooksCubitFailure(failure.errMessage));
      },
      (books) {
        emit(SimilerBooksCubitSuccess(books));
      },
    );
  }

}
