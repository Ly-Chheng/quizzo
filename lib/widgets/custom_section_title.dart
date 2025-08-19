import 'package:flutter/material.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final int? count;
  final Icon? icon;
  final Color? iconColor;
  final String? subtitle;
  final VoidCallback? onTap;

  const SectionTitle({
    super.key,
    required this.title,
    this.count,
    this.icon,
    this.iconColor,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final iconToUse = icon ??
        Icon(
          Icons.arrow_forward,
          size: 20,
          color: iconColor ?? AppColor().primaryColor,
        );

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    count.toString(),
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).titleSize,
                    ),
                  ),
                   SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).titleSize,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    subtitle ?? 'Newest',
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).titleSize,
                      color: AppColor().primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  iconToUse,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
