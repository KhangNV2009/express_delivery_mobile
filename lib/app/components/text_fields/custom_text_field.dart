import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class CustomTextField extends StatelessWidget {
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

  CustomTextField({
    Key? key,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          margin: EdgeInsets.only(
            top: 8,
            bottom: 4,
          ),
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: (errorText?.isNotEmpty == true)
                ? Border.all(
                    color: CustomColors.yellow29,
                    width: 1.5,
                  )
                : Border.all(
                    color: CustomColors.blue236,
                    width: 1.5,
                  ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(),
            ],
          ),
        ),
        (errorText?.isNotEmpty == true)
            ? Container(
                margin: EdgeInsets.only(left: 25),
                child: Text(
                  errorText ?? '',
                  style: CustomTextStyles.zeplin6p5pt().copyWith(
                    color: CustomColors.yellow29,
                  ),
                ),
              )
            : SizedBox(height: 15.0),
      ],
    );
  }

  TextField _buildTextField() {
    return TextField(
      controller: controller,
      keyboardType: inputType ?? TextInputType.emailAddress,
      textAlign: textAlign ?? TextAlign.start,
      cursorColor: Colors.black,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText ?? '',
        hintStyle: CustomTextStyles.zeplin18pt().copyWith(
          color: CustomColors.babyBlue255,
        ),
      ),
      style: CustomTextStyles.zeplin18pt().copyWith(
        color: Colors.black,
      ),
      onChanged: onTextChanged,
    );
  }
}
