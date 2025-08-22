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
            mainAxisAlignment: MainAxisAlignment.start,
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
                      margin: const EdgeInsets.only(right: 15),
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
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 200, 39),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Get.context!.isDarkMode
                        ? Color.fromARGB(255, 2, 165, 17)
                        : Color.fromARGB(255, 2, 165, 17),
                    blurRadius: 0,
                    offset: Offset(0, 5),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                        'https://cdn-icons-png.freepik.com/512/14265/14265913.png',
                        height: 40,
                        color: Color(0XFFFFFFFF)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Quick Play",
                      style: TextStyle(
                        fontFamily: AppFontStyle().fontebold,
                        fontSize: AppFontSize(context).subTitleSize,
                        color: Get.isDarkMode ? Colors.white : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      color: Color.fromARGB(255, 255, 188, 3),
                      boxShadow: [
                        BoxShadow(
                          color: Get.context!.isDarkMode
                              ? Color.fromARGB(255, 174, 126, 1)
                              :Color.fromARGB(255, 174, 126, 1),
                          blurRadius: 0,
                          offset: Offset(0, 5),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://cdn-icons-png.freepik.com/512/5404/5404386.png',
                          height: 40,
                          color: Color(0XFFFFFFFF),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Join Game",
                          style: TextStyle(
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: AppFontSize(context).subTitleSize,
                            color: Get.isDarkMode ? Colors.white : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0XFF6848FE),
                      boxShadow: [
                        BoxShadow(
                          color: Get.context!.isDarkMode
                              ? const Color.fromARGB(255, 46, 28, 156)
                              : const Color.fromARGB(255, 46, 28, 156),
                          blurRadius: 0,
                          offset: Offset(0, 5),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                            'https://cdn-icons-png.freepik.com/512/7376/7376017.png',
                            height: 30,
                            color: Color(0XFFFFFFFF)),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Create Quiz",
                          style: TextStyle(
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: AppFontSize(context).subTitleSize,
                            color: Get.isDarkMode ? Colors.white : Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
