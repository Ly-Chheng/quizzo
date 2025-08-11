  import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: (Get.context?.isPhone ?? true) ? 14 : 16,
        ),
      ),
    );
  }