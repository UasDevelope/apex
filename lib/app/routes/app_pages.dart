import 'package:apex/app/controllers/BottomNavController.dart';
import 'package:apex/app/views/bottom_nav_view.dart';
import 'package:apex/app_binding.dart';
import 'package:get/get.dart';
import '../views/home_view.dart';
import '../bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.BOTTOMNAV,
      page: () => BottomNavView(),
      binding: AppBinding(),
    ),
  ];
}
