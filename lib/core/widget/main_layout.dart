import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utls/app_colors.dart';
import 'package:flutter_application_1/core/utls/app_images.dart';
import 'package:flutter_application_1/core/utls/app_text_style.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/presentation/screens/home_page.dart';
import 'package:flutter_application_1/feature/home/presentation/screens/item_save_screen.dart';
import 'package:flutter_svg/svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, });
   

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  

  int curruntIndex = 0;
  List screens = [HomePage(), Placeholder(), ItemSaveScreen(), Placeholder()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: screens[curruntIndex],
      bottomNavigationBar: SizedBox(
        height: 86,
        child: BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: curruntIndex,
          onTap: (index) {
            setState(() {
              curruntIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.gray400,
          selectedLabelStyle: AppTextStyles.body3Medium,
          unselectedLabelStyle: AppTextStyles.body3Medium,

          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.unselectedHome),
              activeIcon: SvgPicture.asset(AppImages.selectedHome),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.unselectedSearch),
              activeIcon: SvgPicture.asset(AppImages.selectedSearch),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.unselectedlove),
              activeIcon: SvgPicture.asset(AppImages.selectedlove),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.unselectedCar),
              activeIcon: SvgPicture.asset(AppImages.selectedCar),
              label: "Car",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages.unselectedAccount),
              activeIcon: SvgPicture.asset(AppImages.selectedAccount),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
