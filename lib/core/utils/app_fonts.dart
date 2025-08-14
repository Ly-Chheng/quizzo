import 'package:flutter/material.dart';
import 'package:get/get.dart';




class AppFonts {
  // English Fonts "Roboto"
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

  String fontRegular = Get.locale == const Locale('km', 'KM') ? AppFonts().fontKhRegular : AppFonts().fontEngRegular;
  String fontMedium = Get.locale == const Locale('km', 'KM') ? AppFonts().fontKhMedium : AppFonts().fontEngMedium;
  String fontBold = Get.locale == const Locale('km', 'KM') ? AppFonts().fontKhBold : AppFonts().fontEngBold;
}

// Font Size Custom
class AppFontSize {
  late double titleSize; //  titleSize
  late double subTitleSize; //  subtitleSize
  late double descriptionLargeSize; //  descriptionLargeSize
  late double normalTextSize; //  normalTextSize
  late double subNormalSize; // sub Normal TextSize
  late double smallSize; // smallTextSize

  AppFontSize(BuildContext context) {
    bool isTablet = context.isTablet;

    titleSize = isTablet ? 24 : 20;
    subTitleSize = isTablet ? 22 : 18;
    descriptionLargeSize = isTablet ? 20 : 16;
    normalTextSize = isTablet ? 18 : 14;
    subNormalSize = isTablet ? 16 : 12;
    smallSize = isTablet ? 14 : 10;
  }

  // get normalSize => null;
}

// }