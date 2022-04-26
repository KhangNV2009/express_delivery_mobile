import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class CustomAppBars {
  AppBar primaryAppBar({
    String? title,
    List<Widget>? actions,
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: title != null
          ? Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.zeplin10pt().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      backgroundColor: CustomColors.blue178,
      actions: actions,
    );
  }

  AppBar whiteAppBar({
    String? title,
    List<Widget>? actions,
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: title != null
          ? Text(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: CustomTextStyles.zeplin22pt().copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      )
          : null,
      backgroundColor: Colors.white,
      actions: actions,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
