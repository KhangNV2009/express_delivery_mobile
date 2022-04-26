import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class DetailTile extends StatelessWidget {
  final String title;
  final AssetGenImage icon;
  final VoidCallback onTap;
  final bool isFirst;

  DetailTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              isFirst ?
              Container(
                height: 0.4,
                color: CustomColors.gray213,
                width: double.infinity,
              ): SizedBox(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icon.image(
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(width: 15),
                      Text(
                        title,
                        style: CustomTextStyles.zeplin8pt().copyWith(
                          color: CustomColors.gray78,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_rounded,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 0.4,
                color: CustomColors.gray213,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}