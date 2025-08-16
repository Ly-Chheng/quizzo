import 'package:flutter/material.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/custom_card.dart';

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
      "date": "6 month ago",
      "name": "Reoun",
      "subject": "Educational",
      "view": "5.6k plays",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb":
          "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "10 Qs",
      "date": "6 month ago",
      "name": "Soklin",
       "view": "1.6k plays",
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
    final theme = AppTheme();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        title: Text(
          'Discover',
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).titleSize,
            color: theme.iconTheme,
          ),
        ),
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.iconTheme,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset(
              'assets/icons/search.png',
              width: 28,
              height: 28,
              color: theme.iconTheme,
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
                view: quiz['view'], 
                profileUrl: quiz['profile']!,
              );
            },
          ),
        ),
      ),
    );
  }
}

