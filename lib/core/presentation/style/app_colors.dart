import 'package:flutter/material.dart';

abstract class AppColors {
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);

  static const Color darkBLue = Color.fromRGBO(34, 50, 99, 1);
  static const Color textDarkBlue = Color.fromRGBO(24, 40, 89, 1);
  static const Color yellowGold = Color.fromRGBO(235, 204, 170, 1);
  static const Color lightGray = Color.fromRGBO(180, 196, 217, 1);
  static const Color grey = Color.fromRGBO(160, 176, 197, 1);
  static const Color hintColor = Color.fromRGBO(34, 50, 99, 0.5);
}

extension MaterialStateExtension on Color {
  MaterialStateProperty<Color> get materialStateProperty {
    return MaterialStateProperty.all<Color>(this);
  }
}
