import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBars {
  static void success(String message) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void error(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
