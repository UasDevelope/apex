import 'package:apex/app/controllers/BottomNavController.dart';
import 'package:apex/app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => SplashController());
  }
}
