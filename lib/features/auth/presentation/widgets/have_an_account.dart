import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_string.dart';
import 'custom_check_box.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, required this.text1, required this.text2, this.onTap});

  final String text1;
  final String text2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: AppStyles.poppins12Regular.copyWith(
              color: AppColors.deepGrey,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text2,
            style: AppStyles.poppins12Regular.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
