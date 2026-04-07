import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';
import 'package:flutter_application_1/feature/search/logic/cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentSearches extends StatelessWidget {
  RecentSearches({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHome(
                text: "Search",
                textStyle: AppTextStyles.header2,
              ),

              const SizedBox(height: 20),

              /// 🔍 Search field
              CustomTextFromField(
                hintText: "Search for clothes...",
                validation: (e) {},
                controller: searchController,
                onChanged: (value) {
                  context.read<SearchCubit>().search(value);
                },
              ),

              const SizedBox(height: 20),

            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextHome(
                    text: "Recent Searches",
                    textStyle: AppTextStyles.header3,
                  ),

                  GestureDetector(
                    onTap: () {
                      context.read<SearchCubit>().clearAll();
                    },
                    child: TextHome(
                      text: "Clear all",
                      textStyle: AppTextStyles.body2Medium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

       
              if (state is RecentSearchesLoaded)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.searches.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final search = state.searches[index];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          search,
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            context.read<SearchCubit>().removeSearch(search);
                          },
                        ),
                      ],
                    );
                  },
                ),

              if (state is! RecentSearchesLoaded)
                const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
