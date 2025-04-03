import 'package:apex/app/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/BottomNavController.dart';
import '../utils/constants/assets.dart';
import '../utils/constants/strings.dart';
import 'home_view.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';

class BottomNavView extends StatelessWidget {
  final controller = Get.find<BottomNavController>();

  final List<Widget> pages = [HomeView(), ProfileScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),

      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeTab,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: AppColors.appColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                _customNavItem(AppAssets.dashboard, AppStrings.Dashboard, 0),
                _customNavItem(AppAssets.calender, AppStrings.Calendar, 1),
                _customNavItem(AppAssets.supplement, AppStrings.Supplement, 2),
                _customNavItem(AppAssets.guide, AppStrings.Guide, 3),
                _customNavItem(AppAssets.setting, AppStrings.Setting, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _customNavItem(
    String iconPath,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Obx(
        () => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.all(
            controller.selectedIndex.value == index ? 5 : 0,
          ),
          child: Image.asset(
            iconPath,
            width: controller.selectedIndex.value == index ? 32 : 24,
            height: controller.selectedIndex.value == index ? 32 : 24,
            color:
                controller.selectedIndex.value == index
                    ? AppColors.appColor
                    : Colors.grey,
          ),
        ),
      ),
      label: label,
    );
  }
}
