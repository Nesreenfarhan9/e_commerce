import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';

import 'package:flutter_application_1/feature/search/presentation/widgets/empty_search_screen.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: EmptySearchScreen(),);
  }
}