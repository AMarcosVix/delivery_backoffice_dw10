import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();
  static AppColors get instance {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0XFF007021);
  Color get secondary => const Color(0XFFFFAB18);
  Color get back => const Color(0XFF140E0E);
}

extension AppColorsExtensions on BuildContext {
  AppColors get color => AppColors.instance;
}
