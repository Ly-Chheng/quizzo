import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/home_controller.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/home/component/quizz_card.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';
import 'package:quizzo/views/home/discover/discover_list_screen.dart';
import 'package:quizzo/views/top_anthors/top_authors_list_screen.dart';
import 'package:quizzo/views/top_conllections/top_conllections_screen.dart';

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
              _buildSectionTitle("Discover", onTap: () {
                Get.to(DiscoverListScreen());
              }),
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

              _buildSectionTitle("Top Authors", onTap: () {
              Get.to(()=> TopAuthorsListScreen());
              }),
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
                        child: topAuthor(
                          name: Authors['name']!,
                          profileUrl: Authors['profile']!,
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildSectionTitle(
                "Top Collections",
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

  Widget _buildSectionTitle(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppFontStyle().fontebold,
                  fontSize: Get.context!.isPhone ? 14 : 16,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: Get.context!.isPhone ? 14 : 16,
                      color: Color(0xFFFFA63D),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/icons/next.png',
                    width: 20,
                    height: 20,
                    color: Color(0xFFFFA63D),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget topAuthor({required String name, required String profileUrl}) {
    return Container(
      width: 75,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(profileUrl),
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
      ),
    );
  }
}
