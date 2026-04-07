import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class RecentSearches extends StatelessWidget {
  RecentSearches({super.key});
  final TextEditingController SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Column(
        children: [
          TextHome(text: "Search", textStyle: AppTextStyles.header2),
          SizedBox(height: 20),

          CustomTextFromField(
            hintText: "Search for clothes...",
            validation: (e) {},
            controller: SearchController,
          ),
          Row(
            children: [
              TextHome(
                text: "Recent Searches",
                textStyle: AppTextStyles.header3,
              ),
              TextHome(text: "Clear all", textStyle: AppTextStyles.body2Medium),
            ],
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentSearches.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recentSearches[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
