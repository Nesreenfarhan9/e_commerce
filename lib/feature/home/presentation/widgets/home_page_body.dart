import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/auth/presentation/widgets/custom_text_from_field.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/grid_view_home.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/list_veiw_home.dart';
import 'package:flutter_application_1/feature/home/presentation/widgets/text_home.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHome(
                text: "Discover", 
                textStyle:AppTextStyles.body8SemiBold.copyWith(color: AppColors.black) ),
                SizedBox(height: 8,),
                CustomTextFormField(hintText: "Search for clothes...",validation: (value){}),
                SizedBox(height: 10,),
              SizedBox(
                height: 36,
               
                child: ListVeiwHome()),
                Expanded(child: GridViewHome()),
           
           
           
           
           
              
            ],
               
         ),
       );
  }
}
