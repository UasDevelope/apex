import 'package:flutter/material.dart';

import '../../data/source/font_source.dart';
import '../../utils/constants/color.dart';
import '../../utils/helpers/app_size.dart';
import '../image/custom_svg.dart';
import '../text/text_widget.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? assetName;
  final Color hintColor, inactiveColor, fillColor;
  final VoidCallback? onSuffixIconClick;
  final String labelText;
  final String? imagePath;
  final bool isPhoneNumber, obscureText, isPromo, readOnly;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final VoidCallback? onTap;
  final int maxLine;
  final double focusBorderWidth,
      unFocusBorderWidth,
      horizontalPadding,
      verticalPadding,
      fontSize;
  final List<String>? options; // Dropdown options

  CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.assetName,
    this.onTap,
    this.onSuffixIconClick,
    required this.labelText,
    required this.controller,
    this.isPromo = false,
    this.onSaved,
    this.onChanged,
    this.readOnly = false,
    this.hintColor = AppColors.dimGreyColor,
    this.inactiveColor = AppColors.dimGreyColor,
    this.fillColor = AppColors.whiteShade,
    this.maxLine = 1,
    this.fontSize = 15,
    this.validator,
    this.focusBorderWidth = 1.3,
    this.unFocusBorderWidth = 1,
    this.isPhoneNumber = false,
    this.horizontalPadding = 20,
    this.verticalPadding = 1,
    this.imagePath,
    this.textInputType = TextInputType.text,
    this.options, // Accept dropdown options
  });

  InputBorder customInputBorder(Color color, {double width = 0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDropdown = options != null && options!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty) ...[
          TextWidget(
            title: labelText,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: AppSize.h1),
        ],
        SizedBox(
          height: maxLine == 1 ? AppSize.getWidth(11) : null,
          child: isDropdown
              ? DropdownButtonFormField<String>(
                  value: controller.text.isNotEmpty ? controller.text : null,
                  onChanged: (value) {
                    controller.text = value ?? "";
                    if (onChanged != null) {
                      onChanged!(value);
                    }
                  },
                  items: options!
                      .map((String option) => DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    focusedBorder: customInputBorder(AppColors.appColor,
                        width: focusBorderWidth),
                    errorBorder: customInputBorder(AppColors.errorColor,
                        width: focusBorderWidth),
                    enabledBorder: customInputBorder(inactiveColor,
                        width: unFocusBorderWidth),
                    fillColor: fillColor,
                    filled: true,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontFamily: FontSource.poppins.value,
                      fontSize: fontSize,
                      color: hintColor.withValues(alpha: 0),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                  ),
                )
              : TextFormField(
                  onFieldSubmitted: onSaved,
                  readOnly: readOnly,
                  keyboardType: textInputType,
                  maxLines: maxLine,
                  controller: controller,
                  obscureText: obscureText,
                  onChanged: onChanged,
                  onTap: onTap,
                  decoration: InputDecoration(
                    focusedBorder: customInputBorder(AppColors.appColor,
                        width: focusBorderWidth),
                    errorBorder: customInputBorder(AppColors.errorColor,
                        width: focusBorderWidth),
                    enabledBorder: customInputBorder(inactiveColor,
                        width: unFocusBorderWidth),
                    fillColor: fillColor,
                    filled: true,
                    hintText: hintText,
                    errorStyle: const TextStyle(
                      color: AppColors.errorColor,
                      fontSize: 13,
                      height: 1.5,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: FontSource.poppins.value,
                      fontSize: fontSize,
                      color: hintColor.withValues(alpha: 0.4),
                    ),
                    prefixIcon: imagePath != null
                        ? IconButton(
                            onPressed: () {},
                            icon: CustomSvgIcon(
                              assetName: imagePath!,
                              width: 15,
                              height: 15,
                            ),
                          )
                        : null,
                    suffixIcon: assetName != null
                        ? IconButton(
                            onPressed: onSuffixIconClick,
                            icon: CustomSvgIcon(assetName: assetName!),
                          )
                        : null,
                  ),
                ),
        ),
      ],
    );
  }
}
