import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/top_collections_controller.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';
import 'package:quizzo/widgets/custom_section_title.dart';
import 'package:quizzo/widgets/custome_card.dart';
import 'package:share_plus/share_plus.dart';

class AuthorsDetailsScreen extends StatefulWidget {
  const AuthorsDetailsScreen({super.key});

  @override
  State<AuthorsDetailsScreen> createState() => _AuthorsDetailsScreenState();
}

class _AuthorsDetailsScreenState extends State<AuthorsDetailsScreen> {
  final List<Map<String, dynamic>> authors = [
    {
      'id': '1',
      'name': 'Rayford Eddings',
      'username': 'rayford_eddings',
      'profileImageUrl':
          'https://img.freepik.com/premium-vector/man-avatar-profile-picture-isolated-background-avatar-profile-picture-man_1293239-4866.jpg',
      'followers': 1250,
      'quizzes': 45,
      'isFollowing': false,
    },
  ];

  final List<Map<String, dynamic>> statsTopRow = [
    {'title': 'Quizzo', 'value': '265'},
    {'title': 'Plays', 'value': '32M'},
    {'title': 'Players', 'value': '274M'},
  ];

  final List<Map<String, dynamic>> statsBottomRow = [
    {'title': 'Collections', 'value': '49'},
    {'title': 'Followers', 'value': '927.3K'},
    {'title': 'Following', 'value': '128'},
  ];

  int selectedTabIndex = 0;

  void _toggleFollow(String authorId) {
    setState(() {
      final index = authors.indexWhere((author) => author['id'] == authorId);
      if (index != -1) {
        authors[index]['isFollowing'] = !authors[index]['isFollowing'];
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
    final quizzoController = Get.put(QuizzoController());
    return Column(
      children: [
        SectionTitle(
          count: 221,
          title: 'Quizzo'.tr,
          subtitle: 'Newest',
          icon: Icon(
            Icons.swap_vert,
            color: AppColor().primaryColor,
          ),
          onTap: () {},
        ),
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
                  profileUrl: quiz['profile'] ?? '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }

Widget _buildCollectionsContent() {
  return Column(
    children: [
      SectionTitle(
        count: 28,
        title: ' Collections'.tr,
        subtitle: 'Newest',
        icon: Icon(
          Icons.swap_vert,
          color: AppColor().primaryColor,
        ),
        onTap: () {},
      ),
      GridView.builder(
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
          return TopCollectionCard(
            name: topCollectionsData[index]['subject']!,
            imageUrl: topCollectionsData[index]['imagesb']!,
          );
        },
      ),
    ],
  );
}


  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(
            fontFamily: 'Nunito-Regular',
            fontSize: AppFontSize(context).descriptionLargeSize,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              FaIcon(FontAwesomeIcons.globe, color: Color(0xFFFFA63D)),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.instagram, color: Color(0xFFFFA63D)),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.twitter, color: Color(0xFFFFA63D)),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.facebook, color: Color(0xFFFFA63D)),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.discord, color: Color(0xFFFFA63D)),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.reddit, color: Color(0xFFFFA63D)),
            ],
          ),
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
                  color: isFollowing
                      ? const Color(0xFFFFA63D)
                      : Colors.transparent,
                  width: 1,
                ),
                color:
                    isFollowing ? Colors.transparent : const Color(0xFFFFA63D),
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

  Widget _buildStatRow(List<Map<String, dynamic>> data) {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: data.length,
      childAspectRatio: 1,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
    ),
    itemCount: data.length,
    itemBuilder: (context, index) {
      final item = data[index];
      return Container(
        decoration: BoxDecoration(
          border: Border(
            right: index != data.length - 1 
                ? BorderSide(
                    width: 1,
                    color: Get.context!.isDarkMode
                        ? const Color.fromARGB(255, 122, 121, 121)
                        : const Color.fromARGB(255, 211, 209, 209),
                  )
                : BorderSide.none,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item['value'],
              style: TextStyle(
                fontFamily: AppFontStyle().fontebold,
                fontSize: AppFontSize(context).titleSize,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['title'],
              style: TextStyle(
                fontFamily: AppFontStyle().fontebold,
                fontSize: AppFontSize(context).descriptionLargeSize,
                color: Get.context!.isDarkMode ? Colors.grey : Colors.grey,
              ),
            ),
          ],
        ),
      );
    },
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
              ? Border.all(
                  color: const Color(0xFFFFA63D),
                  width: 1.5,
                )
              : Border.all(
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
              color: isSelected ? Colors.white : Color(0xFFFFA63D),
            ),
          ),
        ),
      ),
    );
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
        centerTitle: false,
        iconTheme: IconThemeData(
          color: theme.iconTheme,
        ),
        actions: [
          IconButton(
              onPressed: () {
                // _shareAuthor();
                 Share.share('Share',);
              },
              icon: Image.network(
                'https://assets.streamlinehq.com/image/private/w_300,h_300,ar_1/f_auto/v1/icons/phosphor-light/telegram-logo-light-81nvt6to578dvjiggf7hw6.png/telegram-logo-light-1qpz5f7i4zngpne9mrbjsw.png?_a=DATAg1AAZAA0',
                height: 25,
                color: theme.iconTheme,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.network(
                'https://cdn-icons-png.flaticon.com/512/570/570223.png',
                height: 25,
                color: theme.iconTheme,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://images.assetsdelivery.com/compings_v2/thares2020/thares20202101/thares2020210100545.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Authors list
              ...authors.map(_buildAuthorCard),
              Divider(
                  thickness: 1,
                  color: Get.context!.isDarkMode
                      ? const Color.fromARGB(255, 122, 121, 121)
                      : Color.fromARGB(255, 211, 209, 209)),

              _buildStatRow(statsTopRow),
              const Divider(thickness: 1),
              _buildStatRow(statsBottomRow),
              Divider(
                  thickness: 1,
                  color: Get.context!.isDarkMode
                      ? const Color.fromARGB(255, 122, 121, 121)
                      : Color.fromARGB(255, 211, 209, 209)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabButton("Quizzo", 0),
                  _buildTabButton("Collections", 1),
                  _buildTabButton("About", 2),
                ],
              ),
              const SizedBox(height: 10),
              _buildTabContent(),
            ],
          ),
        ),
      ),
      // floatingActionButton: selectedTabIndex == 1
      //     ? FloatingActionButton(
      //         onPressed: () {},
      //         backgroundColor: AppColor().primaryColor,
      //         child: const Icon(Icons.add),
      //       )
      //     : null,
    );
  }
}
