
import 'package:flutter/material.dart';

class CustomShadows {
  static List<BoxShadow> primaryShadow() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 2,
        offset: Offset(1, 3), // changes position of shadow
      ),
    ];
  }

  static List<BoxShadow> iconShadow() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 0.5,
        blurRadius: 1,
        offset: Offset(0.5, 1.5), // changes position of shadow
      ),
    ];
  }

  static List<BoxShadow> insideShadow(Color backgroundColor) {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.8),
      ),
      BoxShadow(
        color: backgroundColor,
        spreadRadius: -2.2,
        blurRadius: 2.0,
        offset: Offset(0.5, 1.5),
      ),
    ];
  }
}