import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class CustomSearch extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onTextChanged;
  final AssetGenImage? suffixIcon;
  final VoidCallback? onSuffixIconClicked;
  final bool? shouldShowFilter;

  CustomSearch({
    Key? key,
    required this.hintText,
    required this.controller,
    this.onTextChanged,
    this.suffixIcon,
    this.onSuffixIconClicked,
    this.shouldShowFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          shouldShowFilter == true ?
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(right: 6),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: (){},
                  child: Assets.images.imgIconFilter.image(
                    height: 22,
                    width: 22,
                  ),
                ),
              ),
            ),
          ): SizedBox(),
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              margin: EdgeInsets.only(
                top: 8,
                bottom: 4,
              ),
              height: 38,
              decoration: BoxDecoration(
                color: CustomColors.gray214,
                borderRadius: BorderRadius.circular(7),
              ),
              child: _buildTextField(),
            ),
          ),
        ],
      ),
    );
  }

  TextField _buildTextField() {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.start,
      cursorColor: CustomColors.gray78,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIconConstraints: BoxConstraints(
          maxWidth: 30.0,
          maxHeight: 30.0,
        ),
        prefixIcon: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Assets.images.imgIconOutlineSearch.image(
            height: 18,
            width: 18,
          ),
        ),
        suffixIcon: (suffixIcon != null)
            ? GestureDetector(
                onTap: onSuffixIconClicked,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: suffixIcon?.image(
                    height: 18,
                    width: 18,
                  ),
                ),
              )
            : SizedBox(),
        suffixIconConstraints: BoxConstraints(
          maxWidth: 30.0,
          maxHeight: 30.0,
        ),
        hintText: hintText ?? '',
        hintStyle: CustomTextStyles.zeplin8pt().copyWith(
          color: CustomColors.gray78,
        ),
      ),
      style: CustomTextStyles.zeplin8pt().copyWith(
        color: CustomColors.gray78,
      ),
      onChanged: onTextChanged,
    );
  }
}
