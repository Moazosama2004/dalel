class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthFailureState extends AuthState {
  final String errMessage;

  AuthFailureState({required this.errMessage});
}

final class ChangeTermsAndConditionsState extends AuthState {}