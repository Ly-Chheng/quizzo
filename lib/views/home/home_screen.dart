import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/home_controller.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/home/component/quizz_card.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';
import 'package:quizzo/views/home/discover/discover_list_screen.dart';
import 'package:quizzo/views/library/custom_image_view.dart' show customImage;
import 'package:quizzo/views/top_anthors/top_authors_list_screen.dart';
import 'package:quizzo/views/top_conllections/top_conllections_screen.dart';
import 'package:quizzo/widgets/section_reusable.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _refreshContent() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshContent,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(),
              SizedBox(
                height: 4,
              ),
              ReusableSectionTitle(
                title: 'Discover',
                onTap: () {
                  Get.to(DiscoverListScreen());
                },
              ),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: quizData.length,
                  itemBuilder: (context, index) {
                    final quiz = quizData[index];
                    return QuizCard(
                      imageUrl: quiz['image']!,
                      title: quiz['title']!,
                      questionCount: quiz['questions']!,
                      name: quiz['name']!,
                      profileUrl: quiz['profile']!,
                    );
                  },
                ),
              ),
              ReusableSectionTitle(
                title: 'Top Authors',
                onTap: () {
                  Get.to(TopAuthorsListScreen());
                },
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topAuthors.length,
                  itemBuilder: (context, index) {
                    final Authors = topAuthors[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 600),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: topAuthor(
                            name: Authors['name']!,
                            profileUrl: Authors['profile']!,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ReusableSectionTitle(
                title: 'Top Collections',
                onTap: () {
                  Get.to(TopCollectionsScreen());
                },
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: quizData.length,
                  itemBuilder: (context, index) {
                    final quiz = quizData[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: TopCollectionCard(
                        name: quiz['name']!,
                        imageUrl: quiz['imagesb']!,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Center(
      child: GestureDetector(
        // onTap: () {
        //   Get.to(FindFriendsScreen());
        // },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/home/quick_play.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Get.context!.isDarkMode
                    ? Color.fromARGB(255, 57, 29, 167)
                    : Color.fromARGB(255, 57, 29, 167),
                blurRadius: 0,
                offset: Offset(0, 5),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                child: Text(
                  "Quick Play",
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).titleSize,
                    color: Get.isDarkMode ? Colors.white : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topAuthor({required String name, required String profileUrl}) {
    return Column(
      children: [
        CircleAvatar(
          radius: context.isPhone ? 35 : 50,
          backgroundColor: Colors.white,
          child: customImage(
            imageUrl: profileUrl,
            width: context.isPhone ? Get.height * 0.09 : Get.height * 0.1,
            height: context.isPhone ? Get.height * 0.09 : Get.height * 0.1,
            isProfile: true,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).descriptionLargeSize,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
