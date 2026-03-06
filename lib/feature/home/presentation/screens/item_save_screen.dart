import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/item_save_body.dart';

class ItemSaveScreen extends StatelessWidget {
  const ItemSaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemSaveBody(),
    );
  }
}