import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/product_widget.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: .65,
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return ProductWidget();
        },
      ),
    );
  }
}
