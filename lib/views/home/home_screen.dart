import 'package:flutter/material.dart';

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
      "title": "Get Smarter and Boost Your Skills with the Ultimate Productivity Quiz",
      "questions": "12 Qs",
      "name": "Chamreoun",
      "profile": "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
    },
    {
      "image": "https://i.ytimg.com/vi/OQjkFQAIOck/maxresdefault.jpg",
      "title": "Boost Your Brainpower with Engaging Productivity Quizzes",
      "questions": "15 Qs",
      "name": "Soklin",
      "profile": "https://static.vecteezy.com/system/resources/previews/002/002/403/non_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg"
    },
        {
      "image": "https://ahaslides.com/wp-content/uploads/2022/11/SEO1599thumb.png",
      "title": "Create idea come for cambodai",
      "questions": "5 Qs",
      "name": "Heng",
      "profile": "https://img.freepik.com/premium-photo/bearded-man-illustration_665280-67047.jpg"
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
              _buildSectionTitle("Discover"),
              SizedBox(
                height: 190,
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/home/banner.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16),
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
              onPressed: () {},
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
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Row(
          children: [
            // TextButton(onPressed: () {}, child: const Text("View all",style: TextStyle(color: Color(0xFFFFA63D)),)),
            Text("View all",style: TextStyle(color: Color(0xFFFFA63D),fontWeight: FontWeight.w500,),),
            IconButton(onPressed: (){}, icon: Icon(Icons.east_outlined,color: Color(0xFFFFA63D)),)
          ],
        ),
      ],
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
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text(
                    title,
                     maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Show "..." if too long
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
