import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/library/sub_tab_quizzo/sub_quizzo_detail.dart';

import 'package:quizzo/widgets/custom_card.dart';
import 'package:quizzo/widgets/custom_section_title.dart';

class SubQuizzoTab extends StatefulWidget {
  const SubQuizzoTab({super.key});

  @override
  State<SubQuizzoTab> createState() => _SubQuizzoTabState();
}

class _SubQuizzoTabState extends State<SubQuizzoTab> {
  @override
  Widget build(BuildContext context) {
    final quizzocontroller = Get.put(QuizzoController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            count: 45,
            title: ' Quizzes'.tr,
            icon: Icon(
              Icons.swap_vert,
              color: AppColor().primaryColor,
            ),
            onTap: () {},
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quizzocontroller.myQuizzodata.length,
              itemBuilder: (context, index) {
                final quiz = quizzocontroller.myQuizzodata[index];
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return DraggableScrollableSheet(
                          initialChildSize: 1,
                          expand: false,
                          builder: (context, scrollController) {
                            return SubQuizzoDetail(
                              scrollController: scrollController,
                            );
                          },
                        );
                      },
                    );
                  },
                  child: quizCard(
                      context: context,
                      imageUrl: quiz['image']!,
                      title: quiz['title']!,
                      questionCount: quiz['questions']!,
                      date: quiz['date']!,
                      name: quiz['name']!,
                      view: quiz['view'],
                      profileWidget: Row(
                        children: [
                          Icon(
                            quiz['type'] == 'Public'
                                ? Icons.groups_rounded
                                : Icons.person_2_outlined,
                            color: AppColor().secondaryText,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            quiz['type']!,
                            style: TextStyle(
                              fontFamily: AppFontStyle().fontRegular,
                              fontSize: Get.context!.isPhone ? 12 : 14,
                              color: AppColor().secondaryText,
                            ),
                          ),
                        ],
                      ),
                      profileUrl: ''),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
