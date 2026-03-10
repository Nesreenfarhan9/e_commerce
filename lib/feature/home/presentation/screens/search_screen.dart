import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchScreenBody(),);
  }
}