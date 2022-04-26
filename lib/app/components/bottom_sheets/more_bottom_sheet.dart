import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../gen/assets.gen.dart';
import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class MoreBottomSheet extends StatelessWidget {
  final List<Tuple3<String, AssetGenImage, VoidCallback>> items;

  MoreBottomSheet({
    Key? key,
    required this.items,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return _buildRadioItem(
            title: item.item1,
            onTap: () {
              Get.back();
              item.item3.call();
            },
            icon: item.item2,
          );
        },
      ),
    );
  }

  Container _buildRadioItem({
    required VoidCallback onTap,
    required String title,
    required AssetGenImage icon,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: icon.image(
                  height: 26,
                  width: 26,
                ),
              ),
              Expanded(
                flex: 10,
                child: Text(
                  title,
                  style: CustomTextStyles.zeplin8pt().copyWith(
                    color: CustomColors.gray87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
