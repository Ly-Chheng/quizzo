// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:quizzo/core/services/firebase_services.dart';
// import 'package:quizzo/core/services/themes_services.dart';
// import 'package:quizzo/core/utils/app_language.dart';
// import 'package:quizzo/core/utils/local_storage.dart';
// import 'package:quizzo/firebase_options.dart';
// import 'package:quizzo/route.dart';

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   debugPrint("-------------Handling a background message: ${message.data}");
// }

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // Set the background messaging handler early on, as a named top-level function
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   await FirebaseServices().getInstance();
//   await LocalStorage.init(); //? this use for store to local storage (Device)
//   await GetStorage.init(); //? this use for store to local storage (Device)
//   await dotenv.load(fileName: "assets/.env");
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     //? Declare for use ey kr ban
//     final storage = GetStorage();
//     return GetMaterialApp(
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeService().lightTheme,
//       darkTheme: ThemeService().darkTheme,
//       themeMode: ThemeService().getThemeMode(),
//       initialRoute: '/', //? initial route "SplashScreen"
//       getPages: appRoute, //? use for manage routes
//       translations: AppTranslations(),
//       fallbackLocale: AppTranslations().fallbackLocale,
//       locale: storage.read('langCode') != null ? Locale(storage.read('langCode'), storage.read('countryCode')) : const Locale('km', 'KM'),
//     );
//   }
// }


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizzo/core/services/firebase_services.dart';
import 'package:quizzo/core/services/themes_services.dart';
import 'package:quizzo/core/utils/app_language.dart';
import 'package:quizzo/core/utils/local_storage.dart';
import 'package:quizzo/firebase_options.dart';
import 'package:quizzo/route.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint("-------------Handling a background message: ${message.data}");
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Handle background Firebase messages
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Init services
  await FirebaseServices().getInstance();
  await LocalStorage.init();
  await GetStorage.init();
  await dotenv.load(fileName: "assets/.env");

  // Read onboarding flag
  final storage = GetStorage();
  final hasSeenOnboarding = storage.read('hasSeenOnboarding') ?? false;

  runApp(MyApp(hasSeenOnboarding: hasSeenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    final storage = GetStorage();
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeService().lightTheme,
      darkTheme: ThemeService().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      // FIXED: First install → '/' | After onboarding → '/BottomNavigationBar'
      initialRoute: hasSeenOnboarding ? '/SpleshGloble' : '/',
      getPages: appRoute,
      translations: AppTranslations(),
      fallbackLocale: AppTranslations().fallbackLocale,
      locale: storage.read('langCode') != null
          ? Locale(storage.read('langCode'), storage.read('countryCode'))
          : const Locale('km', 'KM'),
    );
  }
}
