import 'package:dalel/features/auth/presentation/views/login_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/onboardingView',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: '/signupView',
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
