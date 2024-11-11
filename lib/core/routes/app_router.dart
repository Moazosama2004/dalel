import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/views/login_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/home/presentation/views/widgets/home_nav_bar_widget.dart';
import 'package:dalel/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      builder: (context, state) => BlocProvider(
        create: (context) =>  AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: '/forgotPasswordView',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: '/navbarView',
      builder: (context, state) => const HomeNavBarWidget(),
    ),
    GoRoute(
      path: '/homeView',
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
