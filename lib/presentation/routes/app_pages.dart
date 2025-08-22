import 'package:get/get.dart';
import 'app_routes.dart';
import 'package:quizzo/presentation/widgets/splash_screen.dart';
import 'package:quizzo/presentation/screens/home/home_screen.dart';
import 'package:quizzo/presentation/screens/account/acoount_screen.dart';
import 'package:quizzo/presentation/screens/join/join_screen.dart';
import 'package:quizzo/presentation/screens/library/library_screen.dart';
import 'package:quizzo/presentation/screens/create/create_screen.dart';
import 'package:quizzo/presentation/screens/account/widgets/account_setting.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.library, page: () => const LibraryScreen()),
    GetPage(name: AppRoutes.join, page: () => const JoinScreen()),
    GetPage(name: AppRoutes.create, page: () => const CreateScreen()),
    GetPage(name: AppRoutes.account, page: () => const AcoountScreen()),
    GetPage(name: AppRoutes.setting, page: () => const AccountSetting()),
  ];
}
