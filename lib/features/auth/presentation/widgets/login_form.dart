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

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          // customToastMessage(
          //     message: 'login Successifully', color: Colors.white);
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customPushReplacement(context, '/homeView')
              : customToastMessage(
                  message: 'Please Verify Your Account',
                  color: Colors.blueAccent);
        } else if (state is SignInFailureState) {
          customToastMessage(message: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.loginFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                  labelText: 'Email Address',
                ),
                SizedBox(
                  height: 32,
                ),
                CustomTextFormField(
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                  labelText: 'Password',
                ),
                SizedBox(
                  height: 16,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        customPushReplacement(context, '/forgotPasswordView');
                      },
                      child: Text(
                        AppStrings.forgotPassword,
                        style: AppStyles.poppins12SemiBold,
                      ),
                    )),
                SizedBox(
                  height: 102,
                ),
                state is SignUpLoadingState
                    ? CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : AppCustomButton(
                        onPressed: () {
                          if (authCubit.loginFormKey.currentState!.validate()) {
                            authCubit.signInWithEmailAndPassword();
                          }
                        },
                        text: AppStrings.signIn,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
