import 'package:flutter_application_1/core/widget/main_layout.dart';
import 'package:flutter_application_1/feature/auth/presentation/screens/digit_code_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/screens/forget_password_screen.dart';
import 'package:flutter_application_1/feature/home/data/models/product_model/datum.dart';
import 'package:flutter_application_1/feature/home/presentation/screens/home_page.dart';
import 'package:flutter_application_1/feature/auth/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/screens/reset_password_screen.dart';
import 'package:flutter_application_1/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter_application_1/feature/home/presentation/screens/item_save_screen.dart';
import 'package:flutter_application_1/feature/home/presentation/screens/product_details_screen.dart';
import 'package:flutter_application_1/feature/home/presentation/screens/search_screen.dart';
import 'package:flutter_application_1/feature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter_application_1/feature/splashScreen/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String signUp = '/sign_up';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String digitCode = '/digitCode';
  static const String homePage = '/homePage';
  static const String itemSave = '/itemSave';
  static const String mainLayout = '/mainLayout';
  static const String productDetail = '/productDetail';
    static const String search = '/search';

  static final GoRouter router = GoRouter(
    initialLocation: AppRouter.mainLayout,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRouter.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouter.onboarding,
        name: 'home',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRouter.signUp,
        name: 'signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRouter.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouter.forgetPassword,
        name: 'forgetPawword',
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRouter.resetPassword,
        name: 'resetPassword',
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return ResetPasswordScreen(email: email);
        },
      ),
      GoRoute(
        path: AppRouter.digitCode,
        name: 'digitCode',

        builder: (context, state) {
          final email = state.extra as String? ?? "";
          return DigitCodeScreen(email: email);
        },
      ),
      GoRoute(
        path: AppRouter.homePage,
        name: 'homePage',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRouter.mainLayout,
        name: 'mainLayout',
        builder: (context, state) => MainLayout(),
      ),
      GoRoute(
        path: AppRouter.itemSave,
        name: 'itemSave',
        builder: (context, state) => const ItemSaveScreen(),
      ),
      GoRoute(
        path: AppRouter.productDetail,
        builder: (context, state) {
          final product = state.extra as Datum;

          return ProductDetailsScreen(product: product);
        },
      ),
       GoRoute(
        path: AppRouter.search,
        name: 'search',
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
