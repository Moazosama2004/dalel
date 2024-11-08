import 'package:dalel/core/functions/functions.dart';
import 'package:dalel/core/theme/app_colors.dart';
import 'package:dalel/core/theme/app_styles.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/widgets/app_custom_button.dart';
import 'package:dalel/features/onboarding/presentation/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/databases/cache_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/models/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  int currenPage = 0;

  final List<OnBoardingModel> onBoardingItems = const [
    OnBoardingModel(
        imgSource: Assets.imagesOnBoarding1,
        mainTitle: 'Explore The history with Dalel in a smart way',
        subTitle:
            'Using our app’s history libraries you can find many historical periods'),
    OnBoardingModel(
        imgSource: Assets.imagesOnBoarding2,
        mainTitle: 'From every place on earth',
        subTitle: 'A big variety of ancient places from all over the world'),
    OnBoardingModel(
        imgSource: Assets.imagesOnBoarding3,
        mainTitle: 'Using modern AI technology for better user experience',
        subTitle:
            'AI provide recommendations and helps you to continue the search journey'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
                    customPushReplacement(context, '/signupView');
                  },
                  child: Text(
                    'Skip',
                    style: AppStyles.poppins16Regular
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              onBoardingPageViewBody(
                onBoardingItems: onBoardingItems,
                pageController: _pageController,
                onChanged: (index) {
                  setState(() {
                    currenPage = index;
                  });
                },
              ),
              const SizedBox(
                height: 58,
              ),
              currenPage == onBoardingItems.length - 1
                  ? Column(
                      children: [
                        AppCustomButton(
                          onPressed: () {
                           getIt<CacheHelper>().saveData(
                                key: "isOnBoardingVisited", value: true);
                            customPushReplacement(context, '/signupView');
                          },
                          text: 'Create Account',
                          backgroundColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                           getIt<CacheHelper>().saveData(
                                key: "isOnBoardingVisited", value: true);
                            customPushReplacement(context, '/loginView');
                          },
                          child: Text(
                            'Login Now',
                            style: AppStyles.poppins16Regular
                                .copyWith(color: AppColors.deepGrey),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AppCustomButton(
                        backgroundColor: AppColors.primaryColor,
                        text: 'Next',
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
                        },
                      ),
                    ),
              const SizedBox(
                height: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
