import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/core/utils/app_color.dart';

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

class AuthorsDetailsScreen extends StatefulWidget {
  const AuthorsDetailsScreen({super.key});

  @override
  State<AuthorsDetailsScreen> createState() => _AuthorsDetailsScreenState();
}

class _AuthorsDetailsScreenState extends State<AuthorsDetailsScreen> {
  List<Author> authors = [];
  bool isLoading = true;
  int selectedTabIndex = 0; // 0: Quizzo, 1: Collections, 2: About

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
      ];
      isLoading = false;
    });
  }

  void _toggleFollow(String authorId) {
    setState(() {
      final index = authors.indexWhere((author) => author.id == authorId);
      if (index != -1) {
        authors[index].isFollowing = !authors[index].isFollowing;
      }
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  Widget _buildTabContent() {
    switch (selectedTabIndex) {
      case 0:
        return _buildQuizzoContent();
      case 1:
        return _buildCollectionsContent();
      case 2:
        return _buildAboutContent();
      default:
        return _buildQuizzoContent();
    }
  }

  Widget _buildQuizzoContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Quizzes",
            style: TextStyle(
              fontFamily: AppFontStyle().fontebold,
              fontSize: AppFontSize(context).titleSize,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Get.context!.isDarkMode ? Colors.grey[800] : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFA63D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.quiz,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quiz ${index + 1}: General Knowledge",
                            style: TextStyle(
                              fontFamily: AppFontStyle().fontebold,
                              fontSize: AppFontSize(context).descriptionLargeSize,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${(index + 1) * 125} plays • ${(index + 1) * 10} questions",
                            style: TextStyle(
                              fontFamily: AppFontStyle().fontebold,
                              fontSize: AppFontSize(context).subNormalSize,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCollectionsContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quiz Collections",
            style: TextStyle(
              fontFamily: AppFontStyle().fontebold,
              fontSize: AppFontSize(context).titleSize,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final collections = ['Science', 'History', 'Sports', 'Technology'];
              final colors = [
                Colors.blue,
                Colors.green,
                Colors.red,
                Colors.purple,
              ];
              
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors[index].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colors[index].withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.collections_bookmark,
                      size: 40,
                      color: colors[index],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      collections[index],
                      style: TextStyle(
                        fontFamily: AppFontStyle().fontebold,
                        fontSize: AppFontSize(context).descriptionLargeSize,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${(index + 1) * 3} quizzes",
                      style: TextStyle(
                        fontFamily: AppFontStyle().fontebold,
                        fontSize: AppFontSize(context).subNormalSize,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutContent() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Rayford Eddings",
            style: TextStyle(
              fontFamily: AppFontStyle().fontebold,
              fontSize: AppFontSize(context).titleSize,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Get.context!.isDarkMode ? Colors.grey[800] : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bio",
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).descriptionLargeSize,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).subNormalSize,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildStatItem("Followers", "1,250"),
                    const SizedBox(width: 24),
                    _buildStatItem("Quizzes", "45"),
                    const SizedBox(width: 24),
                    _buildStatItem("Plays", "50K+"),
                  ],
                ),
                const SizedBox(height: 16),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).descriptionLargeSize,
            color: const Color(0xFFFFA63D),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).subNormalSize,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          'Top Authors',
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).titleSize,
            color: theme.iconTheme,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Banner
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Get.context!.isDarkMode ? Colors.grey[800] : Colors.red,
                  ),

                  // Authors list
                  Column(
                    children: authors.map((author) {
                      return AuthorCard(
                        author: author,
                        onFollowToggle: () => _toggleFollow(author.id),
                      );
                    }).toList(),
                  ),

                  // Tab navigation
                  Divider(
                    color: theme.skeletonbaseColorTheme,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildTabButton("Quizzo", 0),
                        _buildTabButton("Collections", 1),
                        _buildTabButton("About", 2),
                      ],
                    ),
                  ),

                  // Tab content
                  _buildTabContent(),
                ],
              ),
            ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final isSelected = selectedTabIndex == index;
    
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFA63D) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isSelected 
              ? null 
              : Border.all(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.3),
                  width: 1,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppFontStyle().fontebold,
              fontSize: AppFontSize(context).descriptionLargeSize,
              color: isSelected 
                  ? Colors.white 
                  : Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  final Author author;
  final VoidCallback onFollowToggle;

  const AuthorCard({
    super.key,
    required this.author,
    required this.onFollowToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 30,
            backgroundColor: Get.context!.isDarkMode
                ? Colors.grey[700]
                : Colors.white,
            backgroundImage: author.profileImageUrl != null
                ? NetworkImage(author.profileImageUrl!)
                : null,
            child: author.profileImageUrl == null
                ? Text(
                    author.name.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Get.context!.isDarkMode
                          ? Colors.white
                          : Colors.black,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 15),

          // Name + Username
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      author.name,
                      style: TextStyle(
                        fontFamily: AppFontStyle().fontebold,
                        fontSize:
                            AppFontSize(context).descriptionLargeSize,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.verified,
                        size: 15, color: Colors.blue),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '@${author.username}',
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize:
                        AppFontSize(context).descriptionLargeSize,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          // Follow button
          GestureDetector(
            onTap: onFollowToggle,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: author.isFollowing
                      ? const Color(0xFFFFA63D)
                      : Colors.transparent,
                  width: 1,
                ),
                color: author.isFollowing
                    ? (Get.context!.isDarkMode
                        ? Colors.white
                        : const Color.fromARGB(255, 229, 226, 226))
                    : const Color(0xFFFFA63D),
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
                  color: author.isFollowing
                      ? const Color(0xFFFFA63D)
                      : Colors.white,
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