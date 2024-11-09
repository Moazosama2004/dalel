import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.lightGrey),
  );
}
