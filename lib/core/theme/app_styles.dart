import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static final pacifico64Regular = TextStyle(
      color: AppColors.deepBrown,
      fontSize: 64,
      fontWeight: FontWeight.w400,
      fontFamily: 'Pacifico');
      
  static final poppins16Regular = TextStyle(
    color: AppColors.deepBrown,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final poppins24Medium = TextStyle(
    color: AppColors.deepBrown,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static final poppins16Light = TextStyle(
    color: AppColors.deepBrown,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static final poppins18Medium = TextStyle(
    color: AppColors.deepBrown,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}