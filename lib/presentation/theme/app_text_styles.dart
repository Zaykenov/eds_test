import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle bodyTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static TextStyle title = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle subtitle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle comment = const TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
}
