import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../functions/build_ouline_input_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.labelText, this.onChanged});

  final String labelText;
  final Function(String)? onChanged;
  // final FormFieldValidator<String>? onValidate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'This Field is Required';
        }
        return null;
      },
      onChanged: onChanged,
      style: AppStyles.poppins14Regular.copyWith(
        color: AppColors.deepblue,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppStyles.poppins15Medium.copyWith(
          color: AppColors.deepGrey,
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }
}
