import 'package:express_delivery/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class CustomTextFieldWhite extends StatelessWidget {
  final String title;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? inputType;
  final bool isFocusable;
  final String? errorText;
  final ValueChanged<String>? onTextChanged;
  final TextAlign? textAlign;
  final AssetGenImage? prefixIcon;
  final AssetGenImage? suffixIcon;
  final VoidCallback? onSuffixIconClicked;
  final bool? obscureText;
  final int? maxLines;
  final double? height;
  final bool? isEnable;
  final TextInputType? keyboardType;

  CustomTextFieldWhite({
    Key? key,
    required this.title,
    this.hintText,
    required this.controller,
    this.inputType,
    required this.isFocusable,
    this.errorText,
    this.onTextChanged,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconClicked,
    this.obscureText,
    this.maxLines,
    this.height,
    this.isEnable,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: CustomTextStyles.zeplin7pt().copyWith(
            color: (errorText?.isNotEmpty == true) ? CustomColors.red67 : CustomColors.gray78,
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.only(
              top: 8,
              bottom: 4,
            ),
            width: double.infinity,
            height: height ?? 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: (errorText?.isNotEmpty == true)
                  ? Border.all(
                      color: CustomColors.red67,
                      width: 1.5,
                    )
                  : Border.all(
                      color: CustomColors.gray214,
                      width: 1,
                    ),
            ),
            child: _buildTextField()),
        (errorText?.isNotEmpty == true)
            ? Text(
                errorText ?? '',
                style: CustomTextStyles.zeplin6p5pt().copyWith(
                  color: CustomColors.red67,
                ),
              )
            : SizedBox(height: 15.0),
      ],
    );
  }

  TextField _buildTextField() {
    return TextField(
      enabled: isEnable,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textAlign: textAlign ?? TextAlign.start,
      cursorColor: CustomColors.gray78,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIconConstraints: BoxConstraints(
          maxWidth: 30.0,
          maxHeight: 20.0,
        ),
        prefixIcon: (prefixIcon != null)
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: prefixIcon?.image(
                  height: 16,
                  width: 16,
                ),
              )
            : SizedBox(),
        suffixIcon: (suffixIcon != null)
            ? GestureDetector(
                onTap: onSuffixIconClicked,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: suffixIcon?.image(
                    height: 16,
                    width: 16,
                  ),
                ),
              )
            : SizedBox(),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 30.0,
          maxHeight: 20.0,
        ),
        hintText: hintText ?? '',
        hintStyle: CustomTextStyles.zeplin8pt().copyWith(
          color: CustomColors.gray146,
        ),
      ),
      style: CustomTextStyles.zeplin8pt().copyWith(
        color: CustomColors.gray78,
      ),
      onChanged: onTextChanged,
    );
  }
}
