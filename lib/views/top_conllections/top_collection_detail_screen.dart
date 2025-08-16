import 'package:flutter/material.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/custom_card.dart';

class TopCollectionDetailScreen extends StatefulWidget {
  const TopCollectionDetailScreen({super.key});

  @override
  State<TopCollectionDetailScreen> createState() =>
      _TopCollectionDetailScreenState();
}

class _TopCollectionDetailScreenState extends State<TopCollectionDetailScreen> {
  final List<Map<String, String>> discoverlistdata = [
    {
      "image":
          "https://imgcdn.stablediffusionweb.com/2024/5/10/b2bdf6af-7831-4c69-8496-a453ede8f1e8.jpg",
      "title": "Re- Tranin Your Branin",
      "questions": "12 Qs",
      "date": "2 week ago",
      "name": "Reoun",
      "subject": "Educational",
      "view": "5.6k plays",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg",
      "imagesb":
          "https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg"
    },
    {
      "image":
          "https://centrepointschools.com/blogs/wp-content/uploads/2025/03/What-you-need-to-know-about-higher-education.jpg",
      "title": "Book is a Window to",
      "questions": "20 Qs",
      "date": "6 month ago",
      "name": "Soklin",
      "subject": "Educational",
      "view": "5.6k plays",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg",
      "imagesb":
          "https://www.sacap.edu.za/wp-content/uploads/2023/10/unique-study-tips-sacap-768x512.jpg"
    },
    {
      "image":
          "https://i.ytimg.com/vi/6U_pqJAdSVw/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLB6dcLyBAwD6bu4W_zjQtYKZZMXAQ",
      "title": "Back to School Quize",
      "questions": "33 Qs",
      "date": "2 year ago ",
      "name": "Heng",
      "subject": "Educational",
      "view": "5.6k plays",
      "profile":
          "https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4853.jpg?w=360",
      "imagesb":
          "https://www.sacap.edu.za/wp-content/uploads/2023/10/unique-study-tips-sacap-768x512.jpg"
    },
  ];

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
          'Education',
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
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://www.cae.net/wp-content/uploads/2024/07/elearning-classroom.jpg',
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "255 Qizzo",
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).titleSize,
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Text("Defualt",
                              style: TextStyle(
                                fontFamily: AppFontStyle().fontebold,
                                fontSize:
                                    AppFontSize(context).descriptionLargeSize,
                                color: const Color(0xFFFFA63D),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/icons/transfer.png',
                            width: 20,
                            height: 20,
                            color: const Color(0xFFFFA63D),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
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
                      view: quiz['view']!,
                      name: quiz['name']!,
                      profileUrl: quiz['profile']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
