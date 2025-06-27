import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());

  final HomeRepoImpl homeRepo;

  Future<void> fetchSearchBooks(String query) async {
    emit(SearchLoading());
    try {
      var books = await homeRepo.fetchSearchBooks(query, homeRepo.apiService);
      if (books.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchSuccess(books));
      }
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }
}