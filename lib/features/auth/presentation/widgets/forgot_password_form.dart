import 'package:dalel/core/theme/app_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_toast_message.dart';
import '../../../../core/functions/functions.dart';
import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/app_custom_button.dart';
import '../cubit/cubit/auth_cubit.dart';
import '../cubit/cubit/auth_state.dart';
import 'custom_text_field.dart';
import 'terms_and_conditions.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          customToastMessage(
            message: 'Check your mail and reset password',
            color: Colors.cyan,
          );
          customPushReplacement(context, '/loginView');
        } else if (state is ForgotPasswordFailureState) {
          customToastMessage(
            message: state.errMessage,
            color: Colors.redAccent,
          );
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                  labelText: 'Email Address',
                ),
                SizedBox(
                  height: 130,
                ),
                state is SignUpLoadingState
                    ? CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : AppCustomButton(
                        onPressed: () {
                          if (authCubit.forgotPasswordFormKey.currentState!
                              .validate()) {
                            authCubit.sendResetPasswordLinkEmail();
                          }
                        },
                        text: AppStrings.sendResetPasswordLink,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
