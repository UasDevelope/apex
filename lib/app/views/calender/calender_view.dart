import 'package:apex/app/utils/constants/color.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/container/custom_app_bar.dart';
import 'package:apex/app/widgets/container/custom_supplement_container.dart';
import 'package:flutter/material.dart';

import '../../widgets/container/custom_calender.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Calendar", action: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            spacing: AppSize.h2,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCalender(),
              ListView.separated(
                itemCount: 4,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (itemBuilder, index) {
                  return supplementContainer(bgColor: AppColors.softWhite);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: AppSize.h2,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
