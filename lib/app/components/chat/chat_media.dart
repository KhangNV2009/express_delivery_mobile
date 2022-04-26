import 'dart:io';

import 'package:flutter/material.dart';

class ChatMedia extends StatelessWidget {
  final List<String?> mediaPaths;

  ChatMedia({
    Key? key,
    required this.mediaPaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: mediaPaths.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (mediaPaths.length < 4) ? mediaPaths.length : 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final path = mediaPaths[index];
        return Image.file(
          File(path ?? ''),
          fit: BoxFit.cover,
        );
      },
    );
  }
}