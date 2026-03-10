import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_images.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/logic/cubitProduct/saved_item_cubit.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/rating_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/size_selector%20.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});

  final Datum product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 20,
          top: 50,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),

                TextHome(
                  text: "Details",
                  textStyle: AppTextStyles.header2,
                ),

                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  IconButton(
                    icon: Icon(
                      context.watch<SavedItemCubit>().isFavorite(product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      //color: Colors.red,
                    ),
                    onPressed: () {
                      final cubit = context.read<SavedItemCubit>();

                      if (cubit.isFavorite(product)) {
                        cubit.removeFavorite(product);
                      } else {
                        cubit.addFavorite(product);
                      }
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 370,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: product.imageCover ?? "",
                  fit: BoxFit.cover,

                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),

                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// Product Title
            TextHome(
              text: product.title ?? '',
              textStyle: AppTextStyles.header2,
             
            ),

            const SizedBox(height: 5),

            /// Rating
            RatingWidget(product: product),

            const SizedBox(height: 10),

       
            TextHome(
              text: product.description ?? '',
              textStyle: AppTextStyles.body1Regular.copyWith(
                color: AppColors.gray500,
              ),
            ),

            const SizedBox(height: 15),

     
            TextHome(
              text: "Choose size",
              textStyle: AppTextStyles.header2,
            ),

            const SizedBox(height: 10),

            const SizeSelector(),

            const SizedBox(height: 20),

       
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextHome(
                      text: "Price",
                      textStyle: AppTextStyles.body2Regular,
                    ),

                    TextHome(
                      text: "\$ ${product.price?.toStringAsFixed(0) ?? '0'}",
                      textStyle: AppTextStyles.header2,
                    ),
                  ],
                ),

      
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                    
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.bag),
                          const SizedBox(width: 8),
                          const Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}