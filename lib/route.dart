import 'package:get/get.dart';
import 'package:quizzo/views/BottomNavigationBar/navigationbar.dart';
import 'package:quizzo/views/auth/complete_your_profile.dart';
import 'package:quizzo/views/auth/forgot_password_screen.dart';
import 'package:quizzo/views/auth/have_account_screen.dart';
import 'package:quizzo/views/auth/new_password_screen.dart';
import 'package:quizzo/views/auth/otp_verification_scree.dart';
import 'package:quizzo/views/auth/sign_up.dart';
import 'package:quizzo/views/friends/find_friends_screen.dart';
import 'package:quizzo/views/onboarding/onboarding_screen.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/views/home/test.dart';
import 'package:quizzo/views/onboarding/splesh_globle_screen.dart';
import 'package:quizzo/test_code/settings/setting_screen.dart';
import 'package:quizzo/views/type_account/type_account_screen.dart';
import 'package:quizzo/widgets/splash_screen.dart';

final appRoute = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/SpleshGloble', page: () => const SpleshGlobleScreen()),
  GetPage(name: '/BottomNavigationBar', page: () =>  BottomNavigationBarScreen()),
  GetPage(name: '/home', page: () => const MyHomePage()),
  GetPage(name: '/test', page: () => const TestScreen()),
  GetPage(name: '/onboarding', page: () =>  OnboardingScreen()),
  GetPage(name: '/accountType', page: () =>  TypeAccountScreen()),
  GetPage(name: '/CreateAccountPage', page: () =>  CreateAccountPage()),
  GetPage(name: '/SignUpPage', page: () =>  SignUpPage()),
  GetPage(name: '/HaveAccountScreen', page: () =>  HaveAccountScreen()),
  GetPage(name: '/ForgotPasswordScreen', page: () =>  ForgotPasswordScreen()),
  GetPage(name: '/OtpVerificationPage', page: () =>  OtpVerificationPage()),
  GetPage(name: '/NewPassword', page: () =>  NewPasswordScreen()),
  GetPage(name: '/SettingsPage', page: () =>  SettingsPage()),
  GetPage(name: '/FindFriends', page: () =>  FindFriendsScreen()),
  
];
