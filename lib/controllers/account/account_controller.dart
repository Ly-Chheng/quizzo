import 'package:get/get.dart';
import 'package:quizzo/core/functions/local_storage.dart';
import 'package:flutter/material.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  var km = const Locale('km', 'KM');
  var us = const Locale('en', 'US');
  final langs = ['Khmer', 'English'];

  List localeList = [
    {
      'name': 'ភាសាខ្មែរ',
      'key': ['km', 'KM'],
      'locale': const Locale('km', 'KM'),
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_Cambodia.svg/800px-Flag_of_Cambodia.svg.png',
    },
    {
      'name': 'English',
      'key': ['en', 'US'],
      'locale': const Locale('en', 'US'),
      'image': 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Great_Britain_%28English_version%29.png',
    }
  ];
  final locales = [const Locale('km', 'KM'), const Locale('en', 'US')];

  Locale _getSaved(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }

  Future<void> updateLanguage(String lang) async {
    final locale = _getSaved(lang);
    if (Get.locale == us) {
      Get.updateLocale(km);
      LocalStorage.storeData(key: 'langCode', value: 'km');
      LocalStorage.storeData(key: 'countryCode', value: 'KM');
    } else {
      Get.updateLocale(us);
      LocalStorage.storeData(key: 'langCode', value: 'en');
      LocalStorage.storeData(key: 'countryCode', value: 'US');
    }
    update();
    Get.back();
    Get.updateLocale(locale);
  }

  List authors = [
    {
      'id': '1',
      'name': 'Rayford Eddings',
      'username': 'rayford_eddings',
      'profileImageUrl': 'https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg',
      'followers': 1250,
      'quizzes': 45,
      'isFollowing': false,
    },
  ];

  final List<Map<String, dynamic>> topCollectionsData = [
    {
      "id": 1,
      "image": "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title": "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Education",
      "profile": "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb": "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "id": 2,
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Quiz",
      "profile": "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb": "https://www.sacap.edu.za/wp-content/uploads/2023/10/unique-study-tips-sacap-768x512.jpg"
    },
  ];

  void toggleFollow(String authorId) {
    print('----- authorId $authorId');
    final index = authors.indexWhere((author) => author['id'] == authorId);
    if (index != -1) {
      authors[index]['isFollowing'] = !authors[index]['isFollowing'];
    }
  }
}
