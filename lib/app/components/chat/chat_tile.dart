import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_shadows.dart';
import '../../constants/custom_text_styles.dart';
import '../../utils/image_utils.dart';


class ChatTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String content;
  final String date;
  final VoidCallback onTap;

  ChatTile({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.content,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 92,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 8,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: CustomShadows.primaryShadow(),
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 17,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: ImageUtils().loadImageUrl(
                                  placeHolder: SizedBox(),
                                  imageUrl: avatarUrl,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: CustomTextStyles.zeplin8pt().copyWith(
                                        color: CustomColors.gray78,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      content,
                                      style: CustomTextStyles.zeplin7pt().copyWith(
                                        color: CustomColors.gray146,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            date,
                            style: CustomTextStyles.zeplin6p5pt().copyWith(
                              color: CustomColors.gray146,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
