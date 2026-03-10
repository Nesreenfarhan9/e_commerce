import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_images.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';
import 'package:flutter_svg/svg.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.product,
  });

  final Datum product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.star),
    
        TextHome(
          text: " ${product.ratingsAverage ?? 0}/5 ",
          textStyle: AppTextStyles.body9Medium,
        ),
    
        TextHome(
          text: "(${product.ratingsQuantity ?? 0} reviews)",
          textStyle: AppTextStyles.body9Medium,
        ),
      ],
    );
  }
}