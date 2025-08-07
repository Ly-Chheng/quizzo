import 'package:get/get.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/views/home/test.dart';
import 'package:quizzo/widgets/splash_screen.dart';

final appRoute = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/home', page: () => const MyHomePage()),
  GetPage(name: '/test', page: () => const TestScreen()),
];
