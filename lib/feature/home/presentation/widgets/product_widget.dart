import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Datum product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 4 / 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: double.infinity,
                    color: AppColors.gray100,
                    child: CachedNetworkImage(
                      imageUrl: product.imageCover ?? "",
                      fit: BoxFit.cover,
          
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
          
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported),
                    ),
                  ),
                ),
              ),
          
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.favorite_border_outlined,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        TextHome(
          text: product.title ?? "",
          textStyle: AppTextStyles.body2SemiBold,
        
        ),

        const SizedBox(height: 4),

        TextHome(
          text: "\$ ${product.price ?? 0}",
          textStyle: AppTextStyles.body3Medium.copyWith(
            color: AppColors.gray500,
          ),
        ),
      ],
    );
  }
}