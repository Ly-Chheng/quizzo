import 'package:flutter/material.dart';
import 'package:quizzo/controllers/home/top_collections_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';

class TopCollectionsScreen extends StatefulWidget {
  const TopCollectionsScreen({super.key});

  @override
  State<TopCollectionsScreen> createState() => _TopCollectionsScreenState();
}

class _TopCollectionsScreenState extends State<TopCollectionsScreen> {
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
          'Top Collections',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 12,
            childAspectRatio: 1.4,
          ),
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            return TopCollectionCard(
              name: quizData[index]['subject']!,
              imageUrl: quizData[index]['imagesb']!,
            );
          },
        ),
      ),
    );
  }
}
