import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final locale = const Locale('km', 'KM');
  final fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'locale': 'en',
          'library': 'Library',
          'profile': 'Profile',
          'create': 'Create',
          'home': 'HomeScreen',
          'discover': 'Discover',
          'view_all': 'View all',
          'save_to_gallery': 'QR code saved to gallery!',
        },
        'km_KM': {
          'locale': 'km',
          'home': 'ទំព័រដើម',
          'save_to_gallery': 'QR code ត្រូវបានរក្សាទុកនៅក្នុងរូបថត!',
          'discover': 'ស្វែងរក',
          'library': 'បណ្ណាល័យ',
          'profile': 'ប្រតិបត្តិការ',
          'create': 'បង្កើត',
          'view_all': 'មើលទាំងអស់',
        },
      };
}
