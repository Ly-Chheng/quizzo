import 'package:flutter/material.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/widgets/custome_card.dart';

class DiscoverListScreen extends StatefulWidget {
  const DiscoverListScreen({super.key});

  @override
  State<DiscoverListScreen> createState() => _DiscoverListScreenState();
}

class _DiscoverListScreenState extends State<DiscoverListScreen> {
  final List<Map<String, String>> discoverlistdata = [
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "date": "6 month ago . 5.6k plays",
      "name": "Reoun",
      "subject": "Educational",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb":
          "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "10 Qs",
      "date": "6 month ago . 5.6k plays",
      "name": "Soklin",
      "subject": "Educational",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://www.sacap.edu.za/wp-content/uploads/2023/10/unique-study-tips-sacap-768x512.jpg"
    },
  ];

  Future<void> _refreshContent() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          'Descover',
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).titleSize,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/icons/search.png',
              width: 28,
              height: 28,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshContent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView.builder(
            itemCount: discoverlistdata.length,
            itemBuilder: (context, index) {
              final quiz = discoverlistdata[index];
              return quizCard(
                context: context,
                imageUrl: quiz['image']!,
                title: quiz['title']!,
                questionCount: quiz['questions']!,
                date: quiz['date']!,
                name: quiz['name']!,
                profileUrl: quiz['profile']!,
              );
            },
          ),
        ),
      ),
    );
  }
}

