import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../utils/helpers/native_helper.dart';

class SplashController extends GetxController {
  RxString appVersion = 'Version ...'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVersion();
    Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed(Routes.login);
    });
  }

  void fetchVersion() async {
    String version = await NativeHelper.getAppVersion();
    appVersion.value = "Version $version";
  }
}
