import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_string.dart';
import 'custom_check_box.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.alreadyHaveAnAccount,
            style: AppStyles.poppins12Regular.copyWith(
              color: AppColors.deepGrey,
            ),
          ),
          TextSpan(
            text: AppStrings.signIn,
            style: AppStyles.poppins12Regular.copyWith(
              color: AppColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
