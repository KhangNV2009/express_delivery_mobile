import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class SecondaryTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;
  final Function(int)? onTap;

  SecondaryTabBar({
    Key? key,
    required this.controller,
    required this.tabs,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: CustomColors.gray78,
      ),
      child: TabBar(
        tabs: tabs,
        controller: controller,
        unselectedLabelColor: Colors.white,
        unselectedLabelStyle: CustomTextStyles.zeplin5pt(),
        labelStyle: CustomTextStyles.zeplin5pt().copyWith(color: Colors.white),
        labelColor: Colors.white,
        enableFeedback: true,
        indicator: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          color: CustomColors.yellow29,
        ),
        onTap: onTap,
      ),
    );
  }
}
