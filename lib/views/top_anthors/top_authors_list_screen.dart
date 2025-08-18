import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/top_authors_controller.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/top_anthors/authors_details_screen.dart';
import 'package:quizzo/widgets/animate_shimmerEffect.dart';
import 'package:quizzo/widgets/loading_screen.dart';
import '../../core/utils/app_color.dart';

class TopAuthorsListScreen extends StatefulWidget {
  const TopAuthorsListScreen({super.key});

  @override
  State<TopAuthorsListScreen> createState() => _TopAuthorsListScreenState();
}

class _TopAuthorsListScreenState extends State<TopAuthorsListScreen> {
  List<Map<String, dynamic>> _authors = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAuthors();
  }

  Future<void> _loadAuthors() async {
    // Simulate the delay in loading data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _authors =
          authorsData.map((data) => Map<String, dynamic>.from(data)).toList();
      _isLoading = false;
    });
  }

  void _toggleFollow(String authorId) {
    setState(() {
      final index = _authors.indexWhere((author) => author['id'] == authorId);
      if (index != -1) {
        _authors[index]['isFollowing'] = !_authors[index]['isFollowing'];
        // You can update followers count here if needed
        // if (_authors[index]['isFollowing']) _authors[index]['followers']++;
        // else _authors[index]['followers']--;
      }
    });
  }

  void _onAuthorTap(Map<String, dynamic> author) {
    // _showAuthorDetails(author);
    // You can uncomment and customize navigation logic as needed
    // Get.toNamed('/author-profile', arguments: author);
    Get.to(() => AuthorsDetailsScreen());
  }

  void _showAuthorDetails(Map<String, dynamic> author) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(author['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: @${author['username']}'),
            const SizedBox(height: 8),
            Text('Followers: ${author['followers']}'),
            const SizedBox(height: 8),
            Text('Quizzes: ${author['quizzes']}'),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to author profile if needed
              // Get.toNamed('/author-profile', arguments: author);
            },
            child: const Text('View Profile'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    final bool isDarkMode = Get.context?.isDarkMode ?? false;

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
        iconTheme: IconThemeData(color: theme.iconTheme),
      ),
      // body: _isLoading
      //     ? const Center(child: RotatingDotsLoader())
      //     : _authors.isEmpty
      //         ? const Center(
      //             child: Text('No authors found',
      //                 style: TextStyle(fontSize: 16, color: Colors.grey)),
      //           )
      //         : RefreshIndicator(
      //             onRefresh: _loadAuthors,
      //             child: ListView.builder(
      //               padding: const EdgeInsets.symmetric(
      //                   horizontal: 15, vertical: 20),
      //               itemCount: _authors.length,
      //               itemBuilder: (context, index) =>
      //                   _buildAuthorCard(_authors[index], isDarkMode),
      //             ),
      //           ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        itemCount: _authors.length,
        itemBuilder: (context, index) =>
            _buildAuthorCard(_authors[index], isDarkMode),
      ),
    );
  }

  Widget _buildAuthorCard(Map<String, dynamic> author, bool isDarkMode) {
    final theme = AppTheme();

    return GestureDetector(
      onTap: () => _onAuthorTap(author),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
           CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: author['profileImageUrl'] != null
                ? ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: author['profileImageUrl']!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => ShimmerEffect(), // your shimmer widget
                      errorWidget: (context, url, error) => const Icon(Icons.person, size: 30, color: Colors.grey),
                    ),
                  )
                : Text(
                    author['name'][0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
          ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        author['name'],
                        style: TextStyle(
                          fontFamily: AppFontStyle().fontebold,
                          fontSize: AppFontSize(context).descriptionLargeSize,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.verified, size: 15, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${author['username']}',
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
            GestureDetector(
              onTap: () => _toggleFollow(author['id']),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: author['isFollowing']
                        ? const Color(0xFFFFA63D)
                        : Colors.transparent,
                    width: 1,
                  ),
                  color: author['isFollowing']
                      ? (isDarkMode
                          ? Colors.white
                          :  Colors.white)
                      : const Color(0xFFFFA63D),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: author['isFollowing']
                      ? null
                      : [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2),
                              blurRadius: 4),
                        ],
                ),
                child: Text(
                  author['isFollowing'] ? 'Following' : 'Follow',
                  style: TextStyle(
                    color: author['isFollowing']
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
      ),
    );
  }
}
