import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/top_authors_controller.dart';
import 'package:quizzo/controllers/home/top_collections_controller.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';
import 'package:quizzo/widgets/animate_shimmerEffect.dart';
import 'package:quizzo/widgets/custome_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showCloseIcon = false;
  bool _isFocused = false;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _showCloseIcon = _searchController.text.isNotEmpty;
      });
    });

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    _focusNode.unfocus();
  }

  void _onTabSelected(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

void _toggleFollow(Map<String, dynamic> author) {
  setState(() {
    author['isFollowing'] = !(author['isFollowing'] ?? false);
  });
}

  Widget _buildTabContent() {
    switch (selectedTabIndex) {
      case 0:
        return _buildQuizzoContent();
      case 1:
        return _buildPeopleContent();
      case 2:
        return _buildCollectionsContent();
      default:
        return _buildQuizzoContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();

    Color borderColor = _isFocused
        ? const Color(0xFFFFA63D)
        : (Get.context!.isDarkMode
            ? const Color(0xff272B36)
            : Colors.white);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.iconTheme,
        ),
        title: TextFormField(
          controller: _searchController,
          focusNode: _focusNode,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/icons/search.png',
                width: 10,
                height: 10,
                color: Colors.grey,
              ),
            ),
            suffixIcon: _showCloseIcon
                ? GestureDetector(
                    onTap: _clearSearch,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.close, color: Colors.black, size: 20),
                    ),
                  )
                : null,
            filled: true,
            fillColor: theme.fillColor,
            hintText: 'Search quiz, people, or collections',
            hintStyle: TextStyle(
              fontFamily: 'Nunito-Regular',
              fontSize: AppFontSize(context).normalTextSize,
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton("Quizzo", 0),
                _buildTabButton("People", 1),
                _buildTabButton("Collections", 2),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(child: _buildTabContent()),
            ),
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
          border: Border.all(
            color: const Color(0xFFFFA63D),
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: AppFontStyle().fontebold,
              fontSize: AppFontSize(context).descriptionLargeSize,
              color: isSelected ? Colors.white : const Color(0xFFFFA63D),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizzoContent() {
    final quizzoController = Get.put(QuizzoController());
    return Column(
      children: quizzoController.myQuizzodata.map((quiz) {
        return quizCard(
          context: context,
          imageUrl: quiz['image'] ?? '',
          title: quiz['title'] ?? '',
          questionCount: quiz['questions'] ?? '0',
          date: quiz['date'] ?? '',
          name: quiz['name'] ?? '',
          view: quiz['view'] ?? '',
          profileUrl: quiz['profile'] ?? '',
        );
      }).toList(),
    );
  }

  Widget _buildCollectionsContent() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 12,
        childAspectRatio: 1.4,
      ),
      itemCount: topCollectionsData.length,
      itemBuilder: (context, index) {
        final item = topCollectionsData[index];
        return TopCollectionCard(
          name: item['subject'] ?? '',
          imageUrl: item['imagesb'] ?? '',
        );
      },
    );
  }

Widget _buildPeopleContent() {
  final topAuthorsController = Get.put(TopAuthorsController());
  final authors = topAuthorsController.authorsData;

  if (authors.isEmpty) {
    return const Center(child: Text("No authors found"));
  }

  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: authors.length,
    itemBuilder: (context, index) {
      final author = authors[index];
      return _buildAuthorCard(author, Get.context!.isDarkMode);
    },
  );
}





  Widget _buildAuthorCard(Map<String, dynamic> author, bool isDarkMode) {
    return GestureDetector(
      onTap: () {},  
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
                        imageUrl: author['profileImageUrl'],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ShimmerEffect(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.person, size: 30, color: Colors.grey),
                      ),
                    )
                  : Text(
                      (author['name']?.isNotEmpty ?? false)
                          ? author['name'][0].toUpperCase()
                          : '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
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
                        author['name'] ?? '',
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
                    '@${author['username'] ?? ''}',
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).descriptionLargeSize,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _toggleFollow(author),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: author['isFollowing'] == true
                        ? const Color(0xFFFFA63D)
                        : Colors.transparent,
                    width: 1,
                  ),
                  color: author['isFollowing'] == true
                      ? Colors.white
                      : const Color(0xFFFFA63D),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: author['isFollowing'] == true
                      ? null
                      : [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2),
                              blurRadius: 4),
                        ],
                ),
                child: Text(
                  author['isFollowing'] == true ? 'Following' : 'Follow',
                  style: TextStyle(
                    color: author['isFollowing'] == true
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
