import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  // Light
  Color primaryColor = const Color(0xFFFFA63D);
  Color secondaryColor = const Color(0xFF04A68B);
  Color backgroundColor = const Color(0xFFFFF5EA);
  Color white = Colors.white;
  Color black = Colors.black;
  Color tableHeader = const Color(0xFFC9FAFF);

  // Dark
  Color darkPrimaryColor = const Color(0xFF212121);
  Color darkSecondaryColor = const Color(0xFF282828);
  Color shadowCardColor = Color.fromARGB(255, 229, 226, 226);

  //shadow
  static BoxShadow defaultShadow = BoxShadow(
    color: Get.context!.isDarkMode
        ? Color.fromARGB(255, 0, 0, 0)
        : Color.fromARGB(255, 229, 226, 226),
    blurRadius: 0,
    offset: Offset(0, 3),
    spreadRadius: 0,
  );
}
