import 'package:dalel/core/functions/validate.dart';
import 'package:dalel/core/theme/app_colors.dart';
import 'package:dalel/core/theme/app_styles.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/app_custom_button.dart';
import 'package:dalel/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/cubit/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_toast_message.dart';
import '../../../../core/functions/functions.dart';
import '../widgets/have_an_account.dart';
import '../widgets/custom_check_box.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_welcome_text_widget.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/terms_and_conditions.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 108,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomWelcomeTextWidget(
                  text: 'Welcome !',
                  style: AppStyles.poppins28SemiBold.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              const SliverToBoxAdapter(
                child: SignUpForm(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: HaveAnAccount(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signIn,
                  onTap: () {
                    customPushReplacement(context, '/loginView');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
