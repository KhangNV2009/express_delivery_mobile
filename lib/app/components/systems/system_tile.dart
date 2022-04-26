import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_shadows.dart';
import '../../constants/custom_text_styles.dart';

class SystemTile extends StatelessWidget {
  final AssetGenImage icon;
  final VoidCallback onTap;
  final String title;

  SystemTile({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: CustomShadows.primaryShadow(),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            margin: EdgeInsets.all(18),
            child: Row(
              children: [
                icon.image(
                  height: 60,
                  width: 60,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: CustomTextStyles.zeplin8pt().copyWith(
                    color: CustomColors.gray78,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}