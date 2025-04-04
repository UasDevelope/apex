import 'package:apex/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/utils/constants/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Apex",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.appColor,
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.whiteShade,
      ),
      initialRoute: Routes.splashScreen,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
    );
  }
}
