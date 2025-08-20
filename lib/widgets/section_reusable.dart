import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

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
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppFontStyle().fontebold,
                  fontSize: Get.context!.isPhone ? 20 : 22,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: Get.context!.isPhone ? 16 : 18,
                      color: AppColor().primaryColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColor().primaryColor,
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
