import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';
import 'package:flutter_application_1/feature/search/logic/cubit/search_cubit.dart';
import 'package:flutter_application_1/feature/search/presentation/widgets/empty_search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(title: Text(product.name ?? ''));
            },
          );
        }

        if (state is SearchEmpty) {
          return EmptySearchScreen();
        }

        if (state is RecentSearchesLoaded) {
          return ListView.builder(
            itemCount: state.searches.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.searches[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    context.read<SearchCubit>().removeSearch(
                      state.searches[index],
                    );
                  },
                ),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
