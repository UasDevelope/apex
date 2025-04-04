import 'package:apex/app/routes/app_routes.dart';
import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/constants/color.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/container/custom_app_bar.dart';
import 'package:apex/app/widgets/container/custom_container.dart';
import 'package:apex/app/widgets/container/custom_supplement_container.dart';
import 'package:apex/app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Setting"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppSize.h2,
            children: [
              CustomContainer(
                  child: ListTile(
                title: TextWidget(
                  title: "Max John",
                  fontSize: 16,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: TextWidget(
                  title: "maxjohn@gmail.com",
                  textAlign: TextAlign.start,
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AppAssets.profile),
                  backgroundColor: AppColors.appColor,
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              )),
              TextWidget(
                title: "Account",
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              CustomContainer(
                  child: Column(
                spacing: AppSize.h2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: buildRowIcon(
                        title: "Account Information",
                        textColor: AppColors.textColor,
                        assetName: AppAssets.account),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.notification);
                    },
                    child: buildRowIcon(
                        title: "Notifications",
                        textColor: AppColors.textColor,
                        assetName: AppAssets.simpleNotification),
                  ),
                  InkWell(
                    onTap: () {},
                    child: buildRowIcon(
                        title: "Help",
                        textColor: AppColors.textColor,
                        assetName: AppAssets.support),
                  ),
                  InkWell(
                    onTap: () {},
                    child: buildRowIcon(
                        title: "Progress",
                        textColor: AppColors.textColor,
                        assetName: AppAssets.progress),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
