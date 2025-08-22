import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/theme/app_colors.dart';
import 'package:quizzo/core/theme/app_fonts.dart';

class ReusableSectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ReusableSectionTitle({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Style.subHeaderTextStyleBold20_22(context)),
              Row(
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: Get.context!.isPhone ? 16 : 18,
                      color: AppColors().primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColors().primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
