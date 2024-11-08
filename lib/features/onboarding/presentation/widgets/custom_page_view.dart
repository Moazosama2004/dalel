import 'package:dalel/features/onboarding/data/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/utils/app_assets.dart';

class onBoardingPageViewBody extends StatelessWidget {
  const onBoardingPageViewBody({super.key, required this.pageController, this.onChanged, required this.onBoardingItems});

  final PageController pageController;
  final Function(int)? onChanged;

  final List<OnBoardingModel> onBoardingItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: PageView.builder(
        onPageChanged: onChanged,
        controller: pageController,
        itemCount: onBoardingItems.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 290,
              width: 343,
              child: Image.asset(onBoardingItems[index].imgSource),
            ),
            const SizedBox(
              height: 32,
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: AppColors.deepBrown,
                  expansionFactor: 5),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              onBoardingItems[index].mainTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.poppins24Medium.copyWith(
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              onBoardingItems[index].subTitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.poppins16Light.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
