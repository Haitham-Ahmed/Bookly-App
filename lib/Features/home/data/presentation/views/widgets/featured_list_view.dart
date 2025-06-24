import 'package:bookly_app/Features/home/data/presentation/views/manger/featured_books_cubit/featuerd_books_cubit.dart';
import 'package:bookly_app/Features/home/data/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/utils/widgets/custom_loding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatuerdBookCubit, FeatuerdBookState>(
      builder: (context, state) {
        if (state is FeatuerdBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(),
                );
              },
            ),
          );
        } else if (state is FeatuerdBookFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const CustomLodingIndicator();
        }
      },
    );
  }
}
