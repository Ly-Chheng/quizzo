import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/collaboration_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/custom_card.dart';
import 'package:quizzo/widgets/custom_section_title.dart';

class CollaborateTab extends StatefulWidget {
  const CollaborateTab({super.key});

  @override
  State<CollaborateTab> createState() => _CollaborateTabState();
}

class _CollaborateTabState extends State<CollaborateTab> {
  @override
  Widget build(BuildContext context) {
    final collaController = Get.put(CollaborationController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            SectionTitle(
              count: 28,
              title: ' Collaboration'.tr,
              subtitle: 'Newest',
              icon: Icon(
                Icons.swap_vert,
                color: AppColor().primaryColor,
              ),
              onTap: () {},
            ),
            Expanded(
              child: ListView.builder(
                itemCount: collaController.collaborationData.length,
                itemBuilder: (context, index) {
                  final quiz = collaController.collaborationData[index];
                  return quizCard(
                    context: context,
                    imageUrl: quiz['image']!,
                    title: quiz['title']!,
                    questionCount: quiz['questions']!,
                    date: quiz['date']!,
                    name: quiz['name']!,
                    view: quiz['view'],
                    profileWidget: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipOval(
                              clipBehavior: Clip.antiAlias,
                              child: Image.network(
                                quiz['profile']!,
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 12,
                              ),
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  quiz['profile']!,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 24,
                              ),
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  quiz['profile']!,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 36,
                              ),
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  quiz['profile']!,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              quiz['number_collab']!,
                              style: TextStyle(
                                fontFamily: AppFontStyle().fontRegular,
                                fontSize: Get.context!.isPhone ? 12 : 14,
                                color: AppColor().secondaryText,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Collaborators',
                              style: TextStyle(
                                fontFamily: AppFontStyle().fontRegular,
                                fontSize: Get.context!.isPhone ? 12 : 14,
                                color: AppColor().secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    profileUrl: '',
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
