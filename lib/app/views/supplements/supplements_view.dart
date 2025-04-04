import 'package:apex/app/routes/app_routes.dart';
import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/button/custom_button.dart';
import 'package:apex/app/widgets/container/custom_app_bar.dart';
import 'package:apex/app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/color.dart';
import '../../widgets/container/custom_supplement_container.dart';

class SupplementsView extends StatelessWidget {
  const SupplementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Supplement"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(title: "Monday"),
                  ListView.separated(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (itemBuilder, index) {
                      return supplementContainer(
                          bgColor: AppColors.softWhite, status: false);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: AppSize.h2,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      tooltipMessage: "Click button to add supplements",
                      horizontalPadding: 18,
                      verticalPadding: 18,
                      title: "Add Supplements",
                      onPressed: () {
                        Get.toNamed(Routes.addSupplements);
                      },
                      imagePath: AppAssets.add,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
