import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/collection_controller.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/widgets/custom_section_title.dart';
import 'package:quizzo/widgets/custome_card.dart';

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

  final List<Map<String, String>> appList = [
    {
      "name": "WhatsApp",
      "icon": "https://cdn.jim-nielsen.com/ios/512/phone-2023-10-05.png?rf=1024"
    },
    {
      "name": "Twitter",
      "icon": "https://cdn-icons-png.flaticon.com/512/2496/2496110.png"
    },
    {
      "name": "Facebook",
      "icon":
          "https://static.vecteezy.com/system/resources/previews/021/495/985/non_2x/facebook-social-media-logo-icon-free-png.png"
    },
    {
      "name": "Instagram",
      "icon": "https://cdn.pixabay.com/photo/2021/06/15/12/14/instagram-6338393_1280.png"
    },
        {
      "name": "Yahoo",
      "icon": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeJvj2yqr27O9sTpC5m5AeVTbnbK_WSi3xdy89poj8YIF3OPHICWE8QNaSo06qDdz5vmE&usqp=CAU"
    },
    {
      "name": "Tiktok",
      "icon": "https://img.pixers.pics/pho(s3:700/PI/54/88/85/48/91/700_PI5488854891_fd892e1ebe755b56602e9f6421f22762_5f9fed4c9f302_.,700,700,jpg)/posters-tiktok-vector-logo.jpg.jpg"
    },
    {
      "name": "Chat",
      "icon":
          "https://i.pinimg.com/736x/42/fb/f1/42fbf1a3a819847213d38f064d6c3313.jpg"
    },
    {
      "name": "WeChat",
      "icon":
          "https://t3.ftcdn.net/jpg/12/08/98/92/360_F_1208989253_JhXUmLsLbkhgQ3qLjZJB8uFnyBgD1Dk8.jpg"
    },
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
                          colController.collectionData[i + 1])
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
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[300],
                child:
                    const Icon(Icons.image_not_supported, color: Colors.grey),
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

  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(
            fontFamily: 'Nunito-Regular',
            fontSize: AppFontSize(context).descriptionLargeSize,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        Row(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(data.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Add a vertical divider between items
          return Container(
              width: 1,
              height: 60,
              color: Get.context!.isDarkMode
                  ? const Color.fromARGB(255, 211, 209, 209)
                  : Color.fromARGB(255, 211, 209, 209));
        }
        final item = data[index ~/ 2];
        return Column(
          mainAxisSize: MainAxisSize.min,
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
        );
      }),
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
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Stack(
                      alignment: AlignmentDirectional.center,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                child: Container(
                                  height: 4,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  "Share",
                                  style: TextStyle(
                                    fontFamily: AppFontStyle().fontebold,
                                    fontSize: AppFontSize(context).titleSize,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                endIndent: 20,
                                indent: 20,
                                color: Get.context!.isDarkMode
                                    ? const Color.fromARGB(255, 211, 209, 209)
                                    : const Color.fromARGB(255, 211, 209, 209),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: appList.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemBuilder: (context, index) {
                                    final item = appList[index];
                                    return Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: 80,
                                        maxHeight: 100,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: Image.network(
                                                item["icon"]!,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: const Icon(
                                                      Icons.broken_image,
                                                      color: Colors.black54,
                                                      size: 20,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Expanded(
                                            child: Text(
                                              item["name"]!,
                                              style: TextStyle(
                                              fontFamily: 'Nunito-Medium',
                                              fontSize: AppFontSize(context).subTitleSize,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Image.network(
                'https://assets.streamlinehq.com/image/private/w_300,h_300,ar_1/f_auto/v1/icons/phosphor-light/telegram-logo-light-81nvt6to578dvjiggf7hw6.png/telegram-logo-light-1qpz5f7i4zngpne9mrbjsw.png?_a=DATAg1AAZAA0',
                height: 25,
              )),
          IconButton(
              onPressed: () {},
              icon: Image.network(
                'https://cdn-icons-png.flaticon.com/512/570/570223.png',
                height: 25,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 110,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[800]
                        : Colors.blue,
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
                      ? const Color.fromARGB(255, 211, 209, 209)
                      : Color.fromARGB(255, 211, 209, 209)),

              // Stats rows
              const SizedBox(height: 10),
              _buildStatRow(statsTopRow),
              const Divider(thickness: 1),
              const SizedBox(height: 8),
              _buildStatRow(statsBottomRow),
              Divider(
                  thickness: 1,
                  color: Get.context!.isDarkMode
                      ? const Color.fromARGB(255, 211, 209, 209)
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
