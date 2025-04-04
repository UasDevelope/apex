import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/container/custom_app_bar.dart';
import 'package:apex/app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../utils/constants/assets.dart';
import '../../widgets/container/custom_container.dart';

class GuideView extends StatelessWidget {
  const GuideView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "Guides"),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView.separated(
              itemBuilder: (itemBuilder, index) {
                return CustomContainer(
                  onTap: () {
                    Get.toNamed(Routes.guideDetail);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSize.h2,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(AppAssets.coverImage,
                            fit: BoxFit.cover),
                      ),
                      TextWidget(
                        title: "Increase Muscle Growth",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (separatorBuilder, index) {
                return SizedBox(
                  height: AppSize.h2,
                );
              },
              itemCount: 4),
        ));
  }
}
