import 'package:dalel/core/theme/app_colors.dart';
import 'package:dalel/core/theme/app_styles.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/functions/functions.dart';
import '../../../../core/utils/app_string.dart';
import '../widgets/custom_welcome_text_widget.dart';
import '../widgets/have_an_account.dart';
import '../widgets/login_form.dart';
import '../widgets/welcome_banner.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WelcomeBannerLogIn(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomWelcomeTextWidget(
              text: 'Welcome Back !',
              style: AppStyles.poppins24SemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          SliverToBoxAdapter(
            child: LoginForm(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: HaveAnAccount(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customPushReplacement(context, '/signupView');
              },
            ),
          ),
        ],
      ),
    );
  }
}
