import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/friends/find_friends_screen.dart';
import 'package:quizzo/views/home/discover/discover_list_screen.dart';
import 'package:quizzo/views/top_conllections/top_conllections_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> quizData = [
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Educational",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb":
          "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "image":
          "https://img.freepik.com/premium-photo/3d-mystery-gift-box-white-banner-frame-with-question-marks-render-background-concept-contest-quiz-game-with-bonus-surprise-present-open-package-giveaway-post-poster_645257-2790.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Quiz",
      "profile": ''
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
  ];
  final List<Map<String, String>> topAuthors = [
    {
      "name": "Reoun",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
    },
    {
      "name": "Soklin",
      "profile": ''
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
    },
    {
      "name": "Heng",
      "profile":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCVkFXQuP6SeZ0ZFnqxL6LuJ3qf8L2uqHB8XYr6dS3zzlHbyj2vp2GuFJ4LggiL7vq-Ks&usqp=CAU",
    },
    {
      "name": "Vanak",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4853.jpg?w=360",
    },
    {
      "name": "Vanak",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4853.jpg?w=360",
    },
  ];

  Future<void> _refreshContent() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshContent,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: quizData.map((quiz) {
                    return QuizCard(
                      imageUrl: quiz['image']!,
                      title: quiz['title']!,
                      questionCount: quiz['questions']!,
                      name: quiz['name']!,
                      profileUrl: quiz['profile']!,
                    );
                  }).toList(),
                ),
              ),
              _buildSectionTitle("Top Authors"),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topAuthors.length,
                  itemBuilder: (context, index) {
                    final Authors = topAuthors[index];
                    return topAuthor(
                      name: Authors['name']!,
                      profileUrl: Authors['profile']!,
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
                    return topCollections(
                      name: quiz['subject']!,
                      imageUrl: quiz['imagesb']!,
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
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/home/banner.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Get.context!.isDarkMode
                  ? Color.fromARGB(255, 81, 57, 175)
                  : Color.fromARGB(255, 81, 57, 175),
              blurRadius: 0,
              offset: Offset(0, 5),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Play quiz together with\n your friends now!",
              style: TextStyle(
                  fontFamily: AppFontStyle().fontebold,
                  fontSize: AppFontSize(context).titleSize,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Get.to(FindFriendsScreen());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Find Friends",
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).normalTextSize,
                    color: const Color(0xFFFFA63D),
                  ),
                ),
              ),
            )
          ],
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

  Widget topCollections({required String name, required String imageUrl}) {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
              child: SizedBox(
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).subTitleSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String questionCount;
  final String name;
  final String profileUrl;

  const QuizCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.questionCount,
    required this.name,
    required this.profileUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return Container(
      width: 160,
      margin: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: theme.cardTheme,
        border: Border.all(
          color: Get.context!.isDarkMode
              ? Color(0xff272B36)
              : Color.fromARGB(255, 229, 226, 226),
        ),
        boxShadow: [
          AppColor.defaultShadow,
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(0XFF6848FE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      questionCount,
                      style: TextStyle(
                          fontFamily: AppFontStyle().fontRegular,
                          fontSize: AppFontSize(context).subNormalSize,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).normalTextSize,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage: NetworkImage(profileUrl),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        name,
                        style: TextStyle(
                          fontFamily: AppFontStyle().fontRegular,
                          fontSize: AppFontSize(context).subNormalSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
