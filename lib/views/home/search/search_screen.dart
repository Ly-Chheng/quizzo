import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/collection_controller.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
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

  /// Dummy authors list for People tab
  List<Map<String, dynamic>> authors = [
    {
      'id': 1,
      'name': 'John Doe',
      'username': 'johndoe',
      'profileImageUrl': null,
      'isFollowing': false,
    },
    {
      'id': 2,
      'name': 'Jane Smith',
      'username': 'janesmith',
      'profileImageUrl': 'https://via.placeholder.com/150',
      'isFollowing': true,
    },
  ];

  @override
  void initState() {
    super.initState();

    // Listen to text changes
    _searchController.addListener(() {
      setState(() {
        _showCloseIcon = _searchController.text.isNotEmpty;
      });
    });

    // Listen to focus changes
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

  void _toggleFollow(int authorId) {
    setState(() {
      final index = authors.indexWhere((a) => a['id'] == authorId);
      if (index != -1) {
        authors[index]['isFollowing'] = !(authors[index]['isFollowing'] ?? false);
      }
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
        : (Get.context!.isDarkMode ? const Color(0xff272B36) : const Color(0XFFFFFFFF));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
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
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.all(15),
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
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.iconTheme,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTabButton("Quizzo", 0),
              const SizedBox(width: 10),
              _buildTabButton("People", 1),
              const SizedBox(width: 10),
              _buildTabButton("Collections", 2),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _buildTabContent(),
            ),
          ),
        ],
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
      children: [
      
        Column(
          children: List.generate(
            quizzoController.myQuizzodata.length,
            (index) {
              final quiz = quizzoController.myQuizzodata[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: quizCard(
                  context: context,
                  imageUrl: quiz['image'] ?? '',
                  title: quiz['title'] ?? '',
                  questionCount: quiz['questions'] ?? '0',
                  date: quiz['date'] ?? '',
                  name: quiz['name'] ?? '',
                  view: quiz['view'] ?? '',
                  profileUrl: quiz['profileUrl'] ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCollectionsContent() {
    final colController = Get.put(CollectionController());
    return Column(
      children: [
       
        for (int i = 0; i < colController.collectionData.length; i += 2)
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildCollectionCard(colController.collectionData[i]),
                ),
                const SizedBox(width: 11),
                Expanded(
                  child: i + 1 < colController.collectionData.length
                      ? _buildCollectionCard(
                          colController.collectionData[i + 1],
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildCollectionCard(Map<String, dynamic> collection) {
    return Container(
      height: 110,
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
            CachedNetworkImage(
              imageUrl: collection['imagesb'] ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[300],
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Text(
                collection['subject'] ?? 'Unknown',
                style: TextStyle(
                  fontFamily: AppFontStyle().fontebold,
                  fontSize: AppFontSize(context).subTitleSize,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeopleContent() {
    return Column(
      children: [
   
        Column(
          children: authors.map((author) => _buildAuthorCard(author)).toList(),
        ),
      ],
    );
  }

  Widget _buildAuthorCard(Map<String, dynamic> author) {
    final bool isFollowing = author['isFollowing'] ?? false;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[700]
                : Colors.grey[300],
            backgroundImage: author['profileImageUrl'] != null
                ? NetworkImage(author['profileImageUrl'])
                : null,
            child: author['profileImageUrl'] == null
                ? Text(
                    author['name'][0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
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
                  children: [
                    Text(
                      author['name'],
                      style: TextStyle(
                        fontFamily: AppFontStyle().fontebold,
                        fontSize: AppFontSize(context).descriptionLargeSize,
                        color: Theme.of(context).colorScheme.onBackground,
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
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _toggleFollow(author['id']),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isFollowing ? const Color(0xFFFFA63D) : Colors.transparent,
                  width: 1,
                ),
                color: isFollowing ? Colors.transparent : const Color(0xFFFFA63D),
                borderRadius: BorderRadius.circular(20),
                boxShadow: isFollowing
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
                isFollowing ? 'Following' : 'Follow',
                style: TextStyle(
                  color: isFollowing ? const Color(0xFFFFA63D) : Colors.white,
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
