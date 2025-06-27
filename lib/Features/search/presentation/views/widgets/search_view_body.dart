// import 'package:bookly_app/Features/home/data/presentation/views/widgets/best_seller_list_view_item.dart';
// import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
// import 'package:bookly_app/core/utils/styles.dart';
// import 'package:flutter/material.dart';

// class SearchViewBody extends StatelessWidget {
//   const SearchViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CustomSearchTextField(),
//           SizedBox(height: 16),
//           Text('Search Result', style: Styles.textStyle18),
//           SizedBox(height: 16),
//           Expanded(child: SearchResultListView()),
//         ],
//       ),
//     );
//   }
// }

// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           //child: BookListViewItem(),
//           child: Text('data'),
//         );
//       },
//     );
//   }
// }



import 'package:bookly_app/Features/home/data/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_cubit.dart/search_cubit.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _searchQuery = query;
      });
      // استدعاء عملية البحث عند تغيير النص
      context.read<SearchCubit>().fetchSearchBooks(query);
    } else {
      setState(() {
        _searchQuery = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            controller: _searchController,
            onSubmitted: (query) {
              if (query.isNotEmpty) {
                context.read<SearchCubit>().fetchSearchBooks(query);
              }
            },
          ),
          const SizedBox(height: 16),
          Text('Search Result', style: Styles.textStyle18),
          const SizedBox(height: 16),
          Expanded(
            child: _searchQuery.isEmpty
                ? const Center(child: Text('Enter a book name to search'))
                : const SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(book: state.books[index]),
              );
            },
          );
        } else if (state is SearchEmpty) {
          return const Center(child: Text('No books found'));
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('Search for books'));
        }
      },
    );
  }
}