import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/custom_error_message.dart';
import 'package:flutter_application_1/core/widget/custom_loading.dart';
import 'package:flutter_application_1/feature/home/logic/cubitHome/home_cubit.dart';
import 'package:flutter_application_1/feature/home/logic/cubitProduct/product_cubit.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/custom_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListVeiwHome extends StatefulWidget {
  const ListVeiwHome({super.key});

  @override
  State<ListVeiwHome> createState() => _ListVeiwHomeState();
}

class _ListVeiwHomeState extends State<ListVeiwHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return CustomLoading();
        }

        if (state is Homefauiler) {
          return CustomErrorMessage(textError: state.errMessage);
        }

        if (state is HomeSucess) {
          final subCategory = state.subCategory.data!;

          return ListView.separated(
            scrollDirection: Axis.horizontal,

            itemCount: subCategory.length + 1,

            itemBuilder: (context, index) {
          
              final text = index == 0
                  ? "All"
                  : subCategory[index - 1].name ?? "";

              return CustomTextButton(
                text: text,

                isSelect: selectedIndex == index,

                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  final productCubit = context.read<ProductCubit>();

                  if (index == 0) {
                    productCubit.getProduct();
                  } else {
                    final categoryId = subCategory[index - 1].id!;
                    productCubit.getProductsByCategory(categoryId);
                  }
                },
              );
            },

            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
