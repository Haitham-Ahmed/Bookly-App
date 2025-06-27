import 'package:bookly_app/Features/home/data/models/book_model/book.model.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/books_action.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final Book book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 18),
        // BookRating(
        //   rating: book.volumeInfo.averageRating ?? 0,
        //   count: book.volumeInfo.ratingsCount ?? 0,
        //   mainAxisAlignment: MainAxisAlignment.center,
        // ),
        BookRating(
  rating: book.volumeInfo.averageRating,
  count: book.volumeInfo.ratingsCount,
  mainAxisAlignment: MainAxisAlignment.center,
),
        const SizedBox(height: 37),
         BooksActions(
           book: book,
         ),
      ],
    );
  }
}
