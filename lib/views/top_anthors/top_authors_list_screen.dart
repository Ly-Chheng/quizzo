import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/loading_screen.dart';
import '../../core/utils/app_color.dart';

// Data model for Author
class Author {
  final String id;
  final String name;
  final String username;
  final String? profileImageUrl;
  final int followers;
  final int quizzes;
  bool isFollowing;

  Author({
    required this.id,
    required this.name,
    required this.username,
    this.profileImageUrl,
    required this.followers,
    required this.quizzes,
    this.isFollowing = false,
  });
}

class TopAuthorsListScreen extends StatefulWidget {
  const TopAuthorsListScreen({super.key});

  @override
  State<TopAuthorsListScreen> createState() => _TopAuthorsListScreenState();
}

class _TopAuthorsListScreenState extends State<TopAuthorsListScreen> {
  List<Author> authors = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAuthors();
  }

  Future<void> _loadAuthors() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      authors = [
        Author(
          id: '1',
          name: 'Rayford Eddings',
          username: 'rayford_eddings',
          profileImageUrl:
              'https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg',
          followers: 1250,
          quizzes: 45,
        ),
        Author(
          id: '2',
          name: 'Willard Goode',
          username: 'willard_goode',
          profileImageUrl:
              'https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4869.jpg',
          followers: 890,
          quizzes: 32,
        ),
        Author(
          id: '3',
          name: 'Hannah Nehls',
          username: 'hannah_nehls',
          profileImageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCVkFXQuP6SeZ0ZFnqxL6LuJ3qf8L2uqHB8XYr6dS3zzlHbyj2vp2GuFJ4LggiL7vq-Ks&usqp=CAU',
          followers: 2100,
          quizzes: 67,
        ),
        Author(
          id: '4',
          name: 'Geoffrey Dorrance',
          username: 'Clinton Kervin',
          profileImageUrl:
              'https://media.istockphoto.com/id/1415055580/vector/3d-man-avatar-happy-smiling-face-icon-young-businessman-student-or-freelancer.jpg?s=612x612&w=0&k=20&c=FmAiiREZji9GV77yogJSLzWfk-COnX864FxKd5A7vtU=',
          followers: 756,
          quizzes: 28,
        ),
        Author(
          id: '5',
          name: 'Clinton Kervin',
          username: 'clinton_kervin',
          profileImageUrl:
              'https://media.istockphoto.com/id/1458818449/vector/3d-man-icon-person-avatar-male-character-face-cartoon-business-glasses-vector-cheerful-boy.jpg?s=612x612&w=0&k=20&c=xRdAjy7284u5eMB_dA2zXIp2oQ8HlYNbEJ6ksC5Mr3Q=',
          followers: 1800,
          quizzes: 53,
        ),
        Author(
          id: '6',
          name: 'Lavern Laboy',
          username: 'lavern_laboy',
          profileImageUrl:
              'https://media.istockphoto.com/id/1389823037/vector/young-smiling-woman-mia-avatar-3d-vector-people-character-illustration-cartoon-minimal-style.jpg?s=612x612&w=0&k=20&c=ciwsDqBIy3mcTxhWN4I1S-kKSTvjoN1einMrQawNZDQ=',
          followers: 1800,
          quizzes: 53,
        ),
        Author(
          id: '7',
          name: 'Aillen Fullbright',
          username: 'aileen_fullbright',
          profileImageUrl:
              'https://media.istockphoto.com/id/1296058958/vector/happy-young-woman-watching-into-rounded-frame-isolated-on-white-3d-vector-illustration.jpg?s=612x612&w=0&k=20&c=x9lmmoKVqxRro-G3S48IWIKQiykb2Yv1CkuiizDJ6gw=',
          followers: 1800,
          quizzes: 53,
        ),
        Author(
          id: '8',
          name: 'Edgar Torrey',
          username: 'edgar_torrey',
          profileImageUrl:
              'https://icon0.com/free/static2/preview2/stock-photo-avatar-man-people-icon-character-cartoon-32593.jpg',
          followers: 1800,
          quizzes: 53,
        ),
      ];
      isLoading = false;
    });
  }

  void _toggleFollow(String authorId) {
    setState(() {
      final index = authors.indexWhere((author) => author.id == authorId);
      if (index != -1) {
        authors[index].isFollowing = !authors[index].isFollowing;
        // Update followers count
        if (authors[index].isFollowing) {
          // authors[index].followers++;
        } else {
          // authors[index].followers--;
        }
      }
    });
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
          'Top Authors',
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
      ),
      body: isLoading
          ? const Center(
              child: RotatingDotsLoader(),
            )
          : authors.isEmpty
              ? const Center(
                  child: Text(
                    'No authors found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadAuthors,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    itemCount: authors.length,
                    itemBuilder: (context, index) {
                      final author = authors[index];
                      return _buildAuthorCard(author);
                    },
                  ),
                ),
    );
  }

  Widget _buildAuthorCard(Author author) {
    final theme = AppTheme();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: author.profileImageUrl != null
                ? NetworkImage(author.profileImageUrl!)
                : null,
            child: author.profileImageUrl == null
                ? Text(
                    author.name.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      author.name,
                      style: TextStyle(
                        fontFamily: AppFontStyle().fontebold,
                        fontSize: AppFontSize(context).descriptionLargeSize,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(Icons.verified, size: 15, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '@${author.username}',
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).descriptionLargeSize,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // Follow Button
          GestureDetector(
            onTap: () => _toggleFollow(author.id),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: author.isFollowing
                      ? Color(0xFFFFA63D)
                      : Colors.transparent,
                  width: 1,
                ),
                color: author.isFollowing
                    ? (Get.context!.isDarkMode
                        ? Colors.white
                        : Color.fromARGB(255, 229, 226, 226))
                    : Color(0xFFFFA63D),
                borderRadius: BorderRadius.circular(20),
                boxShadow: author.isFollowing
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
              ),
              child: Text(
                author.isFollowing ? 'Following' : 'Follow',
                style: TextStyle(
                  color: author.isFollowing ? Color(0xFFFFA63D) : Colors.white,
                  fontFamily: AppFontStyle().fontebold,
                  fontSize: AppFontSize(context).subNormalSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
