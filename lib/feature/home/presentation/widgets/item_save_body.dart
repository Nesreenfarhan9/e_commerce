import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_router.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/logic/cubitProduct/saved_item_cubit.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/empty_item_saved.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/product_widget.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemSaveBody extends StatelessWidget {
  const ItemSaveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedItemCubit, List<Datum>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return EmptyItemSaved();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 40, left: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                    context.push(AppRouter.mainLayout);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 80),
                  TextHome(
                    text: state.first.brand?.name ?? "Saved Items",
                    textStyle: AppTextStyles.header2,
                  ),
                ],
              ),

              Expanded(
                child: GridView.builder(
                  itemCount: state.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (context, index) {
                    return ProductWidget(product: state[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
