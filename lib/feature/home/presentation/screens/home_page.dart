import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constanst/depenced_injection.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/feature/home/logic/cubitHome/home_cubit.dart';
import 'package:flutter_application_1/feature/home/logic/cubitProduct/product_cubit.dart';

import 'package:flutter_application_1/feature/home/presentation/widgets/home_page_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()..getSubCategory()),
         BlocProvider(create: (context) => getIt<ProductCubit>()..getProduct())
      ],
      
   

      child: Scaffold(backgroundColor: AppColors.white, body: HomePageBody()),
    );
  }
}
