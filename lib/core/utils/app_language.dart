import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final locale = const Locale('km', 'KM');
  final fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'locale': 'en',
          'home': 'HomeScreen',
          'save_to_gallery': 'QR code saved to gallery!',
        },
        'km_KM': {
          'locale': 'km',
          'home': 'ទំព័រដើម',
          'save_to_gallery': 'QR code ត្រូវបានរក្សាទុកនៅក្នុងរូបថត!',
        },
      };
}
