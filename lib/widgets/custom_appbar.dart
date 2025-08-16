import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

customAppBar({
  final String? title,
  final Color? backgroundColor,
  final Color? leadingColor,
  final Color? titleColor,
  final Widget? leading,
  List<Widget>? actions,
  required BuildContext context,
  final bool isLeading = true,
  void Function()? onTap,
  EdgeInsetsGeometry actionPadding =
      const EdgeInsets.symmetric(horizontal: 8.0), // Default padding
}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: Container(
      alignment: Alignment.topLeft,
      child: Text(
        title!,
        style: TextStyle(
          fontFamily: AppFontStyle().fontebold,
          fontSize: Get.context!.isPhone ? 22 : 24,
        ),
      ),
    ),
    automaticallyImplyLeading: false,
    leading: isLeading
        ? Platform.isAndroid
            ? GestureDetector(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                child: Icon(
                  Icons.arrow_back,
                  color: leadingColor ?? Colors.white,
                ),
              )
            : GestureDetector(
                onTap: onTap ??
                    () {
                      Get.back();
                    },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: leadingColor ?? Colors.white,
                ),
              )
        : leading,
    actions: actions?.map((action) {
      return Padding(
        padding: actionPadding,
        child: action,
      );
    }).toList(),
  );
}
