import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({
    super.key,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            number.tr,
            style: TextStyle(
              fontFamily: AppFontStyle().fontebold,
              fontSize: AppFontSize(context).titleSize,
            ),
          ),
          Text(label.tr, style: Style.sub_header20_22_Gray(context)),
        ],
      ),
    );
  }
}

class StatsCardReusable extends StatelessWidget {
  const StatsCardReusable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppTheme().borderTheme,
          thickness: 1.3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatItem(number: '26', label: 'Questions'),
            Container(
              width: 1.3,
              height: 50,
              color: AppTheme().borderTheme,
            ),
            StatItem(number: '8', label: 'Played'),
            Container(
              width: 1.3,
              height: 50,
              color: AppTheme().borderTheme,
            ),
            StatItem(number: '51', label: 'Favourited'),
            Container(
              width: 1.3,
              height: 50,
              color: AppTheme().borderTheme,
            ),
            StatItem(number: '180', label: 'Shared'),
          ],
        ),
        Divider(
          color: AppTheme().borderTheme,
          thickness: 1.3,
        ),
      ],
    );
  }
}
