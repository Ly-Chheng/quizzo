import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/favorite_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/widgets/custom_card.dart';
import 'package:quizzo/widgets/custom_section_title.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    final favoController = Get.put(FavoriteController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            SectionTitle(
              count: 28,
              title: ' Favorites'.tr,
              subtitle: 'Default',
              icon: Icon(
                Icons.swap_vert,
                color: AppColor().primaryColor,
              ),
              onTap: () {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoController.favoriteData.length,
                itemBuilder: (context, index) {
                  final quiz = favoController.favoriteData[index];
                  return quizCard(
                    context: context,
                    imageUrl: quiz['image']!,
                    title: quiz['title']!,
                    questionCount: quiz['questions']!,
                    date: quiz['date']!,
                    name: quiz['name']!,
                    view: quiz['view'],
                    profileUrl: quiz['profile']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
