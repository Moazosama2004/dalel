import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_string.dart';
import 'custom_check_box.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        const SizedBox(
          width: 8,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.iHaveAgreeToOur,
                style: AppStyles.poppins12Regular.copyWith(
                  color: AppColors.deepGrey,
                ),
              ),
              TextSpan(
                text: AppStrings.termsAndCondition,
                style: AppStyles.poppins12Regular.copyWith(
                    color: AppColors.deepGrey,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
