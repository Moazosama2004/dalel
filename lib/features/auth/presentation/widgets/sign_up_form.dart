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

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          customToastMessage(
              message: 'Successifuly , check your email to verify account', color: Colors.greenAccent);
          customPushReplacement(context, '/loginView');
        } else if (state is SignUpFailureState) {
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
              state is SignUpLoadingState
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
