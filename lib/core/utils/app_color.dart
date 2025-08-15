import 'package:flutter/material.dart';
import 'package:get/get.dart';




class AppColor {
  static BoxShadow defaultShadow = BoxShadow(
    color: Get.context!.isDarkMode
        ? Color(0xff272B36)
        : Color.fromARGB(255, 229, 226, 226),
    blurRadius: 0,
    offset: Offset(0, 3),
    spreadRadius: 0,
  );

  // main color

  Color primaryColor = const Color(0xFFFFA63D);
  Color secondaryColor = const Color(0xFF04A68B);

  // Light
  Color backgroundColor = const Color(0xFFFFF5EA);
  Color white = Colors.white;
  Color black = Colors.black;
  Color tableHeader = const Color(0xFFC9FAFF);

  // Dark
  Color darkPrimaryColor = Colors.black;
  Color darkSecondaryColor = const Color(0xFF282828);
  Color shadowCardColor = Color.fromARGB(255, 229, 226, 226);



  // light colors
  Color lightBackgroundColor = const Color(0xFFF8FCFF);
  Color lightCard = const Color(0xFFFFFFFF);
  Color lightText = const Color(0xFF212121);
  Color lightBorder = const Color(0xFFF0F2F6);
  Color lightActive = const Color(0xFFF1F9FF);

  // Dark colors
  Color darkBackgroundColor = const Color(0xFF121212);
  Color darkCard = const Color(0xFF1F222B);
  Color darkText = const Color(0xFFE0E0E0);
  Color darkBorder = const Color(0xFF4B4B4B);
  Color darkActive = const Color(0xFF2A3336);

  // other​ secondary
  Color secondaryText = const Color(0xFFAAAAAA);
  Color lightDisableColor = const Color(0xFFEEEEEE);
  Color darkDisableColor = const Color(0xFF525252);

  Color infoColor = const Color(0xFF2196F3);
  Color infoColor10 = const Color(0xFF2196F3).withOpacity(0.1);
  Color successColor = const Color(0xFF4CAF50);
  Color successColor10 = const Color(0xFF4CAF50).withOpacity(0.1);
  Color warningColor = const Color(0xFFFFC107);
  Color warningColor10 = const Color(0xFFFFC107).withOpacity(0.1);
  Color dangerColor = const Color(0xFFF44336);
  Color dangerColor10 = const Color(0xFFF44336).withOpacity(0.1);

  // Press or hover
  Color hoverPrimaryColor = const Color(0xFF2B5AD9);
  Color hoverSecondaryColor = const Color(0xFFFB9811);
}

class AppTheme {
  Color backgroundTheme = Get.isDarkMode ? AppColor().darkBackgroundColor : AppColor().lightBackgroundColor;
  Color cardTheme = Get.isDarkMode ? AppColor().darkCard : AppColor().lightCard;
  Color textTheme = Get.isDarkMode ? AppColor().darkText : AppColor().lightText;
  Color borderTheme = Get.isDarkMode ? AppColor().darkBorder : AppColor().lightBorder;
  Color disableTheme = Get.isDarkMode ? AppColor().darkDisableColor : AppColor().lightDisableColor;
  Color activeTheme = Get.isDarkMode ? AppColor().darkActive : AppColor().lightActive;
  Color skeletonbaseColorTheme = Get.isDarkMode ? Color(0xFF404040)  : Color(0xFFF0F2F6);
  Color skeletonhighlightColorTheme = Get.isDarkMode ? Colors.grey[700]! : Color.fromARGB(255, 233, 235, 237);
  Color iconTheme = Get.isDarkMode ? AppColor().lightCard : AppColor().darkCard;
}

