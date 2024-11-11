import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_conditions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firsName;
  String? lastName;
  String? emailAddress;
  String? password;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  bool? termsAndConditionsIsDone;

  signupWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      log(e.code.toString());
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  changeTermsAndConditionsState({required bool isDone}) {
    termsAndConditionsIsDone = isDone;
    emit(ChangeTermsAndConditionsState());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFailureState(errMessage: 'Check Your Email and Password !'));
      }
    } catch (e) {
      emit(SignInFailureState(errMessage: e.toString()));
    }
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  sendResetPasswordLinkEmail() async {
    try {
      emit(ForgotPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ForgotPasswordSuccessState());
    } catch (e) {
      emit(ForgotPasswordFailureState(errMessage: e.toString()));
    }
  }
}
