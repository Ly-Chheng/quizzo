import 'package:get/get.dart';
import 'package:quizzo/views/auth/complete_your_profile.dart';
import 'package:quizzo/views/auth/sign_up.dart';
import 'package:quizzo/views/onboarding/onboarding_screen.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/views/home/test.dart';
import 'package:quizzo/views/type_account/type_account_screen.dart';
import 'package:quizzo/widgets/splash_screen.dart';

final appRoute = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/home', page: () => const MyHomePage()),
  GetPage(name: '/test', page: () => const TestScreen()),
  GetPage(name: '/onboarding', page: () =>  OnboardingScreen()),
  GetPage(name: '/accountType', page: () =>  TypeAccountScreen()),
  GetPage(name: '/CreateAccountPage', page: () =>  CreateAccountPage()),
  GetPage(name: '/SignUpPage', page: () =>  SignUpPage()),
];
