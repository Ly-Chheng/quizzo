import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/views/friends/find_friends_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> quizData = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEw8gnY1BFM7LQbcnqht6FatzV6Ukhc2ZcaQ&s",
      "title":
          "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Reoun",
      "subject": "Educational",
      "profile": "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb": "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "subject": "Quiz",
      "profile":''
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb": "https://www.sacap.edu.za/wp-content/uploads/2023/10/unique-study-tips-sacap-768x512.jpg"
    },
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title": "Create idea come for cambodai",
      "questions": "5 Qs",
      "name": "Heng",
      "subject": "Math",
      "profile":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCVkFXQuP6SeZ0ZFnqxL6LuJ3qf8L2uqHB8XYr6dS3zzlHbyj2vp2GuFJ4LggiL7vq-Ks&usqp=CAU",
      "imagesb": "https://www.teachhub.com/wp-content/uploads/2020/10/Oct-7-Study-Techniques-Backed-by-Research_web.jpg"
    },
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title": "Create idea come for cambodai",
      "questions": "5 Qs",
      "name": "Vanak",
      "subject": "Computer",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4853.jpg?w=360",
      "imagesb": "https://thedigitalbridges.com/wp-content/uploads/2016/05/educator-gamesites.jpg",
    },
    {
      "image":
          "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title": "Create idea come for cambodai",
      "questions": "5 Qs",
      "name": "Heng",
      "subject": "Course",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4853.jpg?w=360",
      "imagesb": "https://theedvolution.com/wp-content/uploads/2023/11/Educational-Games-for-Kids.jpg"
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBanner(),
              SizedBox(height: 10,),
              _buildSectionTitle("Discover"),
              SizedBox(
                height: 195,
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
              SizedBox(height: 10,),
              _buildSectionTitle("Top Authors"),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: quizData.length,
                  itemBuilder: (context, index) {
                    final quiz = quizData[index];
                    return topAuthor(
                      name: quiz['name']!,
                      profileUrl: quiz['profile']!,
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
             _buildSectionTitle("Top Collections"),
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
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/home/banner.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Play quiz together with\n your friends now!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(FindFriendsScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFFFFA63D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text("Find Friends"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Row(
          children: [
            Text(
              "View all",
              style: TextStyle(
                  color: Color(0xFFFFA63D),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.east_outlined, color: Color(0xFFFFA63D)),
            )
          ],
        ),
      ],
    );
  }

  Widget topAuthor({required String name, required String profileUrl}) {
    return Container(
      width: 75,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(profileUrl),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

Widget topCollections({required String name, required String imageUrl}) {
  return Container(
    width: 160,
    margin: const EdgeInsets.symmetric(horizontal: 6),
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
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              // decoration: BoxDecoration(
              //   color: Colors.black.withOpacity(0.85),
              //   borderRadius: BorderRadius.circular(8),
              // ),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
    return Container(
      width: 160,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top Image Background
          Expanded(
            flex: 4,
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
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      questionCount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Content
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage: NetworkImage(profileUrl),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        name,
                        style: const TextStyle(fontSize: 12),
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
