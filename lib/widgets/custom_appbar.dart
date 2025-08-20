import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? leadingColor;
  final Color? titleColor;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isLeading;
  final void Function()? onTap;
  final EdgeInsetsGeometry actionPadding;
  final theme = AppTheme();

  @override
  final Size preferredSize;

  CustomAppBar({
    super.key,
    this.title,
    this.backgroundColor,
    this.leadingColor,
    this.titleColor,
    this.leading,
    this.actions,
    required BuildContext context,
    this.isLeading = true,
    this.onTap,
    this.actionPadding = const EdgeInsets.symmetric(horizontal: 8.0),
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Colors.black,
      title: Container(
        alignment: Alignment.topLeft,
        child: Text(
          title!,
          style: Style.subHeaderTextStyleBold20_22(context),
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
                    color: leadingColor ?? theme.iconTheme,
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
}
