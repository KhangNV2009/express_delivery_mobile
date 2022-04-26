import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class RadioBottomSheet extends StatelessWidget {
  final Function(int) onChanged;
  final int positionSelected;
  final List<String> items;

  RadioBottomSheet({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.positionSelected,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final isFirst = (index == 0);
          final item = items[index];
          return Column(
            children: [
              Visibility(
                visible: isFirst,
                child: SizedBox(height: 26),
              ),
              _buildRadioItem(
                title: item,
                isSelected: (positionSelected == index),
                isFirst: isFirst,
                onTap: () {
                  onChanged(index);
                  Get.back();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Container _buildRadioItem({
    required bool isFirst,
    required bool isSelected,
    required VoidCallback onTap,
    required String title,
  }) {
    return Container(
      width: Get.width,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: isFirst,
                child: Container(
                  height: 0.8,
                  width: double.infinity,
                  color: CustomColors.gray183,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 12,
                    child: Text(
                      title,
                      style: CustomTextStyles.zeplin8pt().copyWith(
                        color: CustomColors.gray87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: isSelected
                        ? Icon(
                            Icons.radio_button_checked_outlined,
                            color: CustomColors.blue178,
                          )
                        : Icon(
                            Icons.radio_button_off_outlined,
                            color: CustomColors.blue178,
                          ),
                  ),
                ],
              ),
              Container(
                height: 0.8,
                width: double.infinity,
                color: CustomColors.gray183,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
