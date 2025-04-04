import 'package:apex/app/utils/constants/assets.dart';
import 'package:apex/app/utils/helpers/app_size.dart';
import 'package:apex/app/widgets/button/custom_button.dart';
import 'package:apex/app/widgets/container/custom_app_bar.dart';
import 'package:apex/app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddSupplements extends StatelessWidget {
  const AddSupplements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Add Supplements", leading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            spacing: AppSize.h2,
            children: [
              CustomTextField(
                  hintText: "Magnesium",
                  labelText: "Select Supplement",
                  controller: TextEditingController()),
              CustomTextField(
                  labelText: "Select Form",
                  hintText: "Capsule",
                  controller: TextEditingController()),
              CustomTextField(
                  labelText: "Select Reason",
                  hintText: "Energy",
                  controller: TextEditingController()),
              CustomTextField(
                  labelText: "Select Frequency",
                  hintText: "Daily",
                  controller: TextEditingController()),
              CustomTextField(
                  labelText: "Select Time",
                  hintText: "Time",
                  imagePath: AppAssets.time,
                  controller: TextEditingController()),
              SizedBox(
                height: AppSize.h2,
              ),
              Row(
                children: [
                  Expanded(child: CustomButton(title: "Save", onPressed: () {}))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
