import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart'
    show AppFontStyle, AppFontSize;
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
            title: 'Quizzes'.tr,
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
                    profileUrl: '');
              },
            ),
          ),
        ],
      ),
    );
  }
}
