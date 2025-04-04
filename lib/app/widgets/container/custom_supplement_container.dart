import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/constants/color.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/container/custom_container.dart';
import 'package:apex/app/widgets/image/custom_svg.dart';
import 'package:apex/app/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class CustomSupplementContainer extends StatelessWidget {
  const CustomSupplementContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.softWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 6.1,
            spreadRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        spacing: AppSize.h2,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRowIcon(
                  spacing: AppSize.h1,
                  title: 'Supplements',
                  textColor: AppColors.textColor,
                  assetName: AppAssets.suppliments),
              buildRowIcon(
                  spacing: AppSize.h1,
                  title: 'Add',
                  textColor: AppColors.appColor,
                  assetName: AppAssets.add),
            ],
          ),
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (itemBuilder, index) {
              return supplementContainer();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: AppSize.h2,
              );
            },
          )
        ],
      ),
    );
  }
}

Widget buildRowIcon({
  required String title,
  required Color textColor,
  String? assetName,
  Widget? child,
  double? spacing,
  double? fontSize,
}) {
  final double effectiveSpacing = spacing ?? AppSize.h2;
  final double effectiveFontSize = fontSize ?? 15;
  return Row(
    spacing: effectiveSpacing,
    children: [
      assetName != null ? CustomSvgIcon(assetName: assetName) : child!,
      TextWidget(
        title: title,
        fontWeight: FontWeight.w500,
        textColor: textColor,
        fontSize: effectiveFontSize,
      )
    ],
  );
}

Widget supplementContainer({bool? status, Color? bgColor}) {
  final bool preferStatus = status ?? true;
  final Color preferBgColor = bgColor ?? AppColors.whiteShade;
  return CustomContainer(
      bgColor: preferBgColor,
      child: Column(
        spacing: AppSize.h2,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                title: "Omega-3",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              if (!preferStatus)
                buildRowIcon(
                    spacing: 2,
                    title: "Intake Time: Morning",
                    textColor: AppColors.dimGreyColor,
                    assetName: AppAssets.time,
                    fontSize: 12),
            ],
          ),
          TextWidget(
            title: "Form: Capsule",
            fontSize: 15,
            textColor: AppColors.textColor.withValues(alpha: 0.8),
          ),
          TextWidget(
            title: "To: Capsule",
            fontSize: 15,
            textColor: AppColors.textColor.withValues(alpha: 0.8),
          ),
          if (preferStatus)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRowIcon(
                    spacing: 2,
                    title: "Intake Time: Morning",
                    textColor: AppColors.dimGreyColor,
                    assetName: AppAssets.time,
                    fontSize: 12),
                buildRowIcon(
                    title: "Status: Missed",
                    textColor: AppColors.dimGreyColor,
                    fontSize: 12,
                    spacing: 2,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: AppColors.successColor,
                    )),
              ],
            )
        ],
      ));
}
