import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/top_conllections/top_collection_detail_screen.dart';

class TopCollectionsScreen extends StatefulWidget {
  const TopCollectionsScreen({super.key});

  @override
  State<TopCollectionsScreen> createState() => _TopCollectionsScreenState();
}

class _TopCollectionsScreenState extends State<TopCollectionsScreen> {
  final List<Map<String, String>> quizData = [
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Education",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb":
          "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Quiz",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://www.sacap.edu.za/wp-content/uploads/2023/10/unique-study-tips-sacap-768x512.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Business",
      "profile": ''
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://img.freepik.com/premium-vector/realistic-3d-mock-up-desktop-computer-blank-screen-monitor-mobile-phone-tablet_662181-111.jpg"
    },
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Entertaniment",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb": "https://etimg.etb2bimg.com/photo/81478822.cms"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Art",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://www.pictoclub.com/wp-content/uploads/2021/09/painting-brushes-scaled.jpg"
    },
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Plants",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb":
          "https://img.freepik.com/premium-vector/world-earth-day-concept-with-plant-growing-earth_1639-47898.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Finace",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://res.cloudinary.com/jerrick/image/upload/v1733571922/67543552269b66001d1c899e.jpg"
    },
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Food & Drink",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb": "https://media.timeout.com/images/105183116/image.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Health",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb": "https://cms-api-in.myhealthcare.co/image/20220910103120.jpeg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Kids",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://img.freepik.com/premium-photo/flash-genius-happy-girl-hold-copybook-pointing-pen-up-child-genius-yellow-background-horizontal-isolated-poster-school-girl-student-banner-header-portrait-schoolgirl-copy-space_545934-40630.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Sports",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://media.istockphoto.com/id/1295248329/photo/beautiful-young-black-boy-training-on-the-football-pitch.jpg?s=612x612&w=0&k=20&c=ws4m_NoSF8fRZGNoq5kVlJSfNghREKihaxsOBXAHOw8="
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Lifestyle",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://img.freepik.com/free-psd/3d-render-healthy-routine-character_23-2151666168.jpg?semt=ais_hybrid&w=740&q=80"
    },
  ];

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
