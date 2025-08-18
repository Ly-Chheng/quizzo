import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFonts {
  // English Fonts "Nunito"
  String fontEngRegular = 'Nunito-Regular';
  String fontEngMedium = 'Nunito-Medium';
  String fontEngBold = 'Nunito-Bold';
  String fontExBold = 'Nunito-Extrabold';

  // Khmer Fonts "Kantumruy"
  String fontKhRegular = 'KantumruyPro-Regular';
  String fontKhMedium = 'KantumruyPro-Medium';
  String fontKhBold = 'KantumruyPro-Bold';
  String fontkhExBold = 'Nunito-Extrabold';

  String fontRegular = 'Regular-Font';
  String fontMedium = 'Medium-Font';
  String fontBold = 'Bold-Font';
  String fontEBold = 'Nunito-Extrabold';
}

// Font Family and font weight Custom
class AppFontStyle {
  String regularFont = AppFonts().fontRegular;
  String mediumFont = AppFonts().fontMedium;
  String boldFont = AppFonts().fontBold;
  String fontebold = AppFonts().fontEBold;

  String fontRegular = Get.locale == const Locale('km', 'KM')
      ? AppFonts().fontKhRegular
      : AppFonts().fontEngRegular;
  String fontMedium = Get.locale == const Locale('km', 'KM')
      ? AppFonts().fontKhMedium
      : AppFonts().fontEngMedium;
  String fontBold = Get.locale == const Locale('km', 'KM')
      ? AppFonts().fontKhBold
      : AppFonts().fontEngBold;
}

// Font Size Custom
class AppFontSize {
  late double titleSize;
  late double subTitleSize;
  late double descriptionLargeSize;
  late double normalTextSize;
  late double subNormalSize;
  late double smallSize;

  AppFontSize(BuildContext context) {
    // iphone
    titleSize = Get.context!.isPhone ? 16 : 18;
    subTitleSize = Get.context!.isPhone ? 16 : 18;
    descriptionLargeSize = Get.context!.isPhone ? 14 : 16;
    normalTextSize = Get.context!.isPhone ? 12 : 14;
    subNormalSize = Get.context!.isPhone ? 10 : 12;
    smallSize = Get.context!.isPhone ? 8 : 10;
  }
}
