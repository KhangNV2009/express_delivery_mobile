import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_shadows.dart';
import '../../constants/custom_text_styles.dart';

class PackageTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  final String weight;

  PackageTile({
    Key? key,
    required this.onTap,
    required this.title,
    required this.description,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: CustomShadows.primaryShadow(),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    FontAwesomeIcons.boxArchive,
                    size: 30,
                    color: CustomColors.green186,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    margin: EdgeInsets.only(left: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: CustomTextStyles.zeplin8pt().copyWith(
                            color: CustomColors.gray87,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          description,
                          style: CustomTextStyles.zeplin7pt().copyWith(
                            color: CustomColors.gray87,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8),
                        Text(
                          '$weight kg',
                          style: CustomTextStyles.zeplin6pt().copyWith(
                            color: CustomColors.gray161,
                          ),
                        )
                      ],
                    ),
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
