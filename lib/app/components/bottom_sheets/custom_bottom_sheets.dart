import 'package:express_delivery/app/components/bottom_sheets/radio_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../gen/assets.gen.dart';
import 'more_bottom_sheet.dart';

class CustomBottomSheets {
  void radioBottomSheet({
    required List<String> items,
    required int positionSelected,
    required Function(int) onChanged,
  }) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return RadioBottomSheet(
          items: items,
          onChanged: onChanged,
          positionSelected: positionSelected,
        );
      },
    );
  }

  void moreBottomSheet({required List<Tuple3<String, AssetGenImage, VoidCallback>> items}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return MoreBottomSheet(items: items);
      },
    );
  }
}
