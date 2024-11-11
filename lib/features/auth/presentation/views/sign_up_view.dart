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
import '../widgets/already_have_an_account.dart';
import '../widgets/custom_check_box.dart';
import '../widgets/custom_text_field.dart';
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
                child: Text(
                  'Welcome !',
                  textAlign: TextAlign.center,
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
              const SliverToBoxAdapter(
                child: AlreadyHaveAnAccount(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          customToastMessage(
              message: 'SignUp is Successifuly', color: Colors.greenAccent);
              customPushReplacement(context, '/homeView');
        } else if (state is AuthFailureState) {
          customToastMessage(message: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signupFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                // onValidate: (firstName) {
                //   validateName(firstName, fieldName: "First Name");
                // },
                onChanged: (firstName) {
                  authCubit.firsName = firstName;
                },
                labelText: 'First Name',
              ),
              SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                // onValidate: (lastName) {
                //   validateName(lastName, fieldName: "Last Name");
                // },
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
                labelText: 'Last Name',
              ),
              SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                // onValidate: (emailAddress) {
                //   validateEmail(emailAddress);
                // },
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
                labelText: 'Email Address',
              ),
              SizedBox(
                height: 32,
              ),
              CustomTextFormField(
                // onValidate: (password) {
                //   validatePassword(password);
                // },
                onChanged: (password) {
                  authCubit.password = password;
                },
                labelText: 'Password',
              ),
              TermsAndConditions(),
              SizedBox(
                height: 86,
              ),
              state is AuthLoadingState
                  ? CircularProgressIndicator(
                      color: Colors.black,
                    )
                  : AppCustomButton(
                      backgroundColor:
                          authCubit.termsAndConditionsIsDone == true
                              ? null
                              : Colors.grey,
                      onPressed: () {
                        if (authCubit.termsAndConditionsIsDone == true) {
                          if (authCubit.signupFormKey.currentState!
                              .validate()) {
                            authCubit.signupWithEmailAndPassword();
                            
                          }
                        }
                      },
                      text: AppStrings.signUp,
                    ),
            ],
          ),
        );
      },
    );
  }
}
