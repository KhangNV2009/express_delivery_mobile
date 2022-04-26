import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class DocumentTile extends StatelessWidget {
  final AssetGenImage icon;
  final VoidCallback onCloseTab;

  DocumentTile({
    Key? key,
    required this.icon,
    required this.onCloseTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: CustomColors.gray214),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: icon.image(
                height: 35,
                width: 35,
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem ipsum dolor sit amet, lorem ipsum dolor sit amet',
                    style: CustomTextStyles.zeplin8pt().copyWith(
                      color: CustomColors.gray78,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '1.0 MB',
                    style: CustomTextStyles.zeplin7pt().copyWith(
                      color: CustomColors.gray168,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: onCloseTab,
                  child: Assets.images.imgIconClose.image(
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
