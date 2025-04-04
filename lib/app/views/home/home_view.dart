import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/chart/monthly_bar_chart.dart';
import 'package:apex/app/widgets/container/custom_container.dart';
import 'package:apex/app/widgets/container/custom_supplement_container.dart';
import 'package:apex/app/widgets/image/custom_svg.dart';
import 'package:apex/app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: AppSize.h2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreeting(),
            MonthlyBarChart(),
            CustomSupplementContainer(),
            TextWidget(
              title: "Discover",
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            CustomContainer(
              child: ListView.separated(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 4,
                itemBuilder: (itemBuilder, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(AppAssets.coverImage, fit: BoxFit.cover),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: AppSize.h2,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Image.asset(AppAssets.logo),
    );
  }

  Widget _buildGreeting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(AppAssets.profile),
          radius: 24,
        ),
        SizedBox(
          width: AppSize.h2,
        ),
        TextWidget(
          title: "Hallo, Max!",
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        Spacer(),
        CustomSvgIcon(assetName: AppAssets.calender1),
        SizedBox(
          width: AppSize.h2,
        ),
        CustomSvgIcon(assetName: AppAssets.notification),
      ],
    );
  }
}
