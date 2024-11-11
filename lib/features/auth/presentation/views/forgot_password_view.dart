import 'package:dalel/core/theme/app_styles.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 64,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                AppStrings.forgotPasswordPage,
                style: AppStyles.poppins24SemiBold,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 235,
                width: 235,
                child: Image.asset(Assets.imagesForgotPassword),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'Enter your registered email below to receive password reset instruction',
                style: AppStyles.poppins14Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: ForgotPasswordForm(),
            ),
          ],
        ),
      ),
    );
  }
}
