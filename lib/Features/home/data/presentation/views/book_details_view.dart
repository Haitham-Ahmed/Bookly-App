import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/presentation/views/manger/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});

  final Book book;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilerBooksCubitCubit>(context).fetchSimilerBooks(
    widget.book,
    category: widget.book.volumeInfo.categories?[0] ?? 'unknown', 
    child: BookDetailsViewBody(book: widget.book,),
  );
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          book: widget.book,
        ),
      ),
    );
  }
}
