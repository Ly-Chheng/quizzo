import 'package:flutter/material.dart';
import 'package:quizzo/controllers/home/discover_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/custom_card.dart';

class DiscoverListScreen extends StatefulWidget {
  const DiscoverListScreen({super.key});

  @override
  State<DiscoverListScreen> createState() => _DiscoverListScreenState();
}

class _DiscoverListScreenState extends State<DiscoverListScreen> {


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

