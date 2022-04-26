import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_shadows.dart';
import '../../constants/custom_text_styles.dart';

class CustomButtons {
  Container primaryButton({
    required String title,
    required VoidCallback? onTap,
    bool isEnable = true,
  }) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isEnable ? Colors.white : CustomColors.blue210,
        gradient: LinearGradient(
          colors: isEnable
              ? [
                  CustomColors.blue236,
                  CustomColors.blue254,
                ]
              : [
                  CustomColors.gray161,
                  CustomColors.gray213,
                ],
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: isEnable ? onTap : null,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: CustomTextStyles.zeplin8p5pt().copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container secondaryButton({
    required String title,
    required VoidCallback? onTap,
    bool isEnable = true,
  }) {
    return Container(
      height: 46,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isEnable ? CustomColors.blue178 : CustomColors.gray97,
        gradient: LinearGradient(
          colors: isEnable
              ? [
                  Colors.white,
                  CustomColors.gray213,
                ]
              : [
                  CustomColors.gray97,
                  CustomColors.gray97,
                ],
        ),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: isEnable ? onTap : null,
          child: Center(
            child: Text(
              title.toUpperCase(),
              style: CustomTextStyles.zeplin15pt().copyWith(
                color: isEnable ? CustomColors.blue236 : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container textButton({
    required String title,
    required VoidCallback? onTap,
    required TextStyle? textStyle,
    Color? backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: backgroundColor,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(6),
            child: Text(
              title,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }

  Container colorButton({
    double? height,
    double? borderRadius,
    required VoidCallback? onTap,
    required Color? backgroundColor,
    required Text text,
  }) {
    return Container(
      height: height == null ? 44 : height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius == null ? 7 : borderRadius),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius == null ? 7 : borderRadius),
          onTap: onTap,
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }

  Container colorEnableButton({
    double? height,
    double? borderRadius,
    required VoidCallback? onTap,
    required Color? enableBackgroundColor,
    required Color? disableBackgroundColor,
    required Text text,
    required bool isEnable,
  }) {
    return Container(
      height: height == null ? 44 : height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isEnable ? enableBackgroundColor : disableBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius == null ? 7 : borderRadius),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius == null ? 7 : borderRadius),
          onTap: onTap,
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }

  Container outlineButton({
    double? height,
    double? borderRadius,
    required VoidCallback? onTap,
    required Color? backgroundColor,
    required Color? outlineColor,
    required Text text,
  }) {
    return Container(
      height: height == null ? 44 : height,
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 7),
          border: Border.all(color: outlineColor ?? Colors.black)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 7),
          onTap: onTap,
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }

  Container colorIconButton({
    required String title,
    required VoidCallback? onTap,
    required Color? backgroundColor,
    required Color? textColor,
    Color? iconColor,
    List<BoxShadow>? boxShadow,
    required AssetGenImage icon,
  }) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7),
        boxShadow: boxShadow,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.image(
                height: 26,
                width: 26,
                color: iconColor,
              ),
              SizedBox(width: 9),
              Text(
                title,
                style: CustomTextStyles.zeplin8p5pt().copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container actionButton({
    required String title,
    required VoidCallback? onTap,
    required bool isEnable,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: 14,
        bottom: 14,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: isEnable ? Colors.white : CustomColors.blue209,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkResponse(
          borderRadius: BorderRadius.circular(7),
          onTap: isEnable ? onTap : null,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            child: Center(
              child: Text(
                title,
                style: CustomTextStyles.zeplin8p5pt().copyWith(
                  color: isEnable ? CustomColors.blue178 : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container insideIconButton({
    required String title,
    required AssetGenImage icon,
    required VoidCallback? onTap,
    required bool isEnable,
  }) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: CustomShadows.insideShadow(
          isEnable ? CustomColors.blue178 : CustomColors.gray97,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.image(
                height: 28,
                width: 28,
              ),
              SizedBox(width: 9),
              Text(
                title,
                style: CustomTextStyles.zeplin8pt().copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
