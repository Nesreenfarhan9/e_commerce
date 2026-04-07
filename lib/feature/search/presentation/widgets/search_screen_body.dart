import 'package:flutter/material.dart';
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
          final products = state.products;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return ListTile(title: Text(product.title ?? ''));
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
