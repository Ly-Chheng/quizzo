import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/top_collections_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/top_conllections/top_collection_detail_screen.dart';

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
              return topCollections(
                name: quizData[index]['subject']!,
                imageUrl: quizData[index]['imagesb']!,
              );
            },
          )),
    );
  }

  Widget topCollections({required String name, required String imageUrl}) {
    return GestureDetector(
      onTap: () {
        Get.to(TopCollectionDetailScreen());
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).subTitleSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
