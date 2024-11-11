import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class CustomWelcomeTextWidget extends StatelessWidget {
  const CustomWelcomeTextWidget({
    super.key,
    required this.text, required this.style,
  });

  final String text;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
