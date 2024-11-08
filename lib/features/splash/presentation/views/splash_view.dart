import 'package:dalel/core/databases/cache_helper.dart';
import 'package:dalel/core/theme/app_colors.dart';
import 'package:dalel/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/services/service_locator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        bool isOnBoardingVisited =  getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
        if(isOnBoardingVisited){
          customPushReplacement(context, "/loginView");
        } else {
          customPushReplacement(context, "/onboardingView");
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Dalel',
          style: AppStyles.pacifico64Regular,
        ),
      ),
    );
  }
}
