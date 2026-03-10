import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/widget/custom_error_message.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/home/logic/cubitProduct/product_cubit.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/product_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GridViewHome extends StatelessWidget {
  const GridViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {

        if (state is ProductLoading) {
          return const CustomLoading();
        }

        if (state is Productfauiler) {
          return CustomErrorMessage(textError: state.errMessage);
        }

        if (state is ProductSucess) {

          final products = state.product.data!;

          if (products.isEmpty) {
            return const Center(
              child: Text("No Product Found"),
            );
          }

          return GridView.builder(
            cacheExtent: 500,
            itemCount: products.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: .7,
            ),

            itemBuilder: (context, index) {

              final product = products[index];

              return GestureDetector(
                onTap: () {
                  context.push(
                    AppRouter.productDetail,
                    extra: product,
                  );
                },
                child: ProductWidget(product: product),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}