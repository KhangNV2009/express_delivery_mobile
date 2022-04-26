import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';
import '../buttons/custom_buttons.dart';

class SfDatePickerDialog extends StatelessWidget {
  final VoidCallback onCancelTap;
  final VoidCallback onConfirmTap;
  final Function(DateTime) onDateChanged;

  SfDatePickerDialog({
    Key? key,
    required this.onCancelTap,
    required this.onConfirmTap,
    required this.onDateChanged,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(0),
      children: [
        Column(
          children: [
            Container(
              height: Get.height / 2,
              width: Get.width,
              child: SfDateRangePickerTheme(
                data: SfDateRangePickerThemeData(
                  todayTextStyle: TextStyle(
                    color: CustomColors.blue178,
                  ),
                  todayCellTextStyle: TextStyle(
                    color: CustomColors.blue178,
                  ),
                ),
                child: SfDateRangePicker(
                  rangeSelectionColor: CustomColors.blue178.withOpacity(0.2),
                  selectionColor: CustomColors.blue178,
                  todayHighlightColor: CustomColors.blue178.withOpacity(0.5),
                  selectionMode: DateRangePickerSelectionMode.single,
                  onSelectionChanged: (date) {
                    var dateTime = date.value;
                    onDateChanged(dateTime);
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButtons().outlineButton(
                      outlineColor: CustomColors.gray167,
                      borderRadius: 5,
                      height: 30,
                      onTap: onCancelTap,
                      backgroundColor: Colors.white,
                      text: Text(
                        'Hủy'.toUpperCase(),
                        style: CustomTextStyles.zeplin7p5pt().copyWith(
                          color: CustomColors.gray167,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomButtons().colorButton(
                      borderRadius: 5,
                      height: 30,
                      onTap: onConfirmTap,
                      backgroundColor: CustomColors.blue178,
                      text: Text(
                        'Xác nhận'.toUpperCase(),
                        style: CustomTextStyles.zeplin7p5pt().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
