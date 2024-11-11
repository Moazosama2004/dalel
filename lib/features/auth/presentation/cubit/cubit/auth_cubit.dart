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
  bool? termsAndConditionsIsDone;

  signupWithEmailAndPassword() async {
    try {
      emit(AuthLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      log(e.code.toString());
      if (e.code == 'weak-password') {
        emit(
            AuthFailureState(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailureState(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(AuthFailureState(errMessage: e.toString()));
    }
  }

  changeTermsAndConditionsState({required bool isDone}) {
    termsAndConditionsIsDone = isDone;
    emit(ChangeTermsAndConditionsState());
  }
}
