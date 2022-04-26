import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';
import '../../constants/custom_text_styles.dart';

class ChatText extends StatelessWidget {
  final String message;

  ChatText({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: CustomTextStyles.zeplin8pt().copyWith(
        color: CustomColors.gray87,
      ),
    );
  }
}
