import 'package:bookly_app/Features/home/data/presentation/views/manger/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerBooksCubitCubit, SimilerBooksCubitState>(
      builder: (context, state) {
        if (state is SimilerBooksCubitSuccess) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.15,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: CustomBookImage(
            imageUrl: 'https://www.pinterest.com/pin/983192162374136600/',
          ),
        );
      },
    ),
  );
} else if (state is SimilerBooksCubitFailure) {
  return CustomErrorWidget(errorMessage: state.errMessage);
} else {
  return const CustomLodingIndicator();
}
      },
    );
  }
}
