import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

class WelcomeBannerLogIn extends StatelessWidget {
  const WelcomeBannerLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Dalel',
            style: AppStyles.saira32Bold.copyWith(
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.imagesPyramids),
              SvgPicture.asset(Assets.imagesIslamic),
            ],
          ),
        ],
      ),
    );
  }
}
