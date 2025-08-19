import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class QuizCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String questionCount;
  final String name;
  final String profileUrl;

  const QuizCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.questionCount,
    required this.name,
    required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return Container(
      width: 160,
      margin: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: theme.cardTheme,
        border: Border.all(
          color: Get.context!.isDarkMode
              ? Color(0xff272B36)
              : Color.fromARGB(255, 229, 226, 226),
        ),
        boxShadow: [
          // AppColor.defaultShadow,
          BoxShadow(
            color: Get.context!.isDarkMode
                ? Color(0xff272B36)
                : Color.fromARGB(2255, 229, 226, 226),
            blurRadius: 0,
            offset: Offset(0, 5),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0XFF6848FE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      questionCount,
                      style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          fontSize: AppFontSize(context).subNormalSize,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).normalTextSize,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage: NetworkImage(profileUrl),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          fontSize: AppFontSize(context).subNormalSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
