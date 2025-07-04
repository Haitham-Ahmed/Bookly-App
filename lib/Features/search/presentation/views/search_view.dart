// import 'package:bookly_app/Features/search/presentation/views/widgets/search_view_body.dart';
// import 'package:flutter/material.dart';

// class SearchView extends StatelessWidget {
//   const SearchView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: SafeArea(child: SearchViewBody()));
//   }
// }



import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_cubit.dart/search_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<HomeRepoImpl>()),
      child: const Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}