import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

Widget quizCard({
  required BuildContext context,
  required String imageUrl,
  required String title,
  required String questionCount,
  required String name,
  required String date,
  String? view,
  required String profileUrl,
}) {
  final theme = AppTheme();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Container(
      height: 115,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.cardTheme,
          boxShadow: [
            BoxShadow(
              // color: Color.fromRGBO(0, 0, 0, 0.05),
              color: Get.context!.isDarkMode
                  ? Color.fromRGBO(0, 0, 0, 0.05)
                  : Color.fromARGB(2255, 229, 226, 226),
              blurRadius: 24,
              spreadRadius: 0,
              offset: Offset(
                0,
                6,
              ),
            ),
            BoxShadow(
              // color: Color.fromRGBO(0, 0, 0, 0.08),
              color: Get.context!.isDarkMode
                  ? const Color.fromARGB(255, 70, 69, 69)
                  : Color.fromRGBO(0, 0, 0, 0.08),
              blurRadius: 0,
              spreadRadius: 1,
              offset: Offset(
                0,
                0,
              ),
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 13,
                  right: 13,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0XFF6848FE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      questionCount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).subTitleSize,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                            fontFamily: AppFontStyle().fontBold,
                            fontSize: AppFontSize(context).subNormalSize,
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 3),
                     Icon(
                        Icons.circle,  
                      
                        size: 5,
                        color: Get.context!.isDarkMode
                            ? Colors.grey
                            : Colors.grey,
                      ),

                      const SizedBox(width: 3),
                      Text(
                        view ?? "",
                        style: TextStyle(
                          fontFamily: AppFontStyle().fontBold ?? 'Roboto',
                          fontSize: AppFontSize(context).subNormalSize,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
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
                            fontFamily: AppFontStyle().fontRegular,
                            fontSize: AppFontSize(context).subNormalSize,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
