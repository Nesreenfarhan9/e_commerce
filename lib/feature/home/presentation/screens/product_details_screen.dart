import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
 ProductDetailsScreen({super.key, required this.product});
    final Datum product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ProductDetailsBody(product: product,),
    );
  }
}
