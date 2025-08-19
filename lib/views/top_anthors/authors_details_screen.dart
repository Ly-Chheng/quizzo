import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/home/top_collections_controller.dart';
import 'package:quizzo/controllers/library/collection_controller.dart';
import 'package:quizzo/controllers/library/quizzo_controller.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';
import 'package:quizzo/widgets/animate_shimmerEffect.dart';
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

  // void _shareAuthor() {
  //   final author = authors.first; // Get the first author
  //   String message = "Check out ${author['name']} (@${author['username']}) on Quizzo! 🚀\n"
  //       "Quizzes: ${author['quizzes']}\n"
  //       "Followers: ${author['followers']}\n\n"
  //       "Download Quizzo now!";

  //   Share.share(
  //     message,
  //     subject: "Check out this amazing Quizzo author!",
  //   );
  // }

  // Optional: Keep the platform-specific share method for future use
  // void _shareContent(String platform) {
  //   final author = authors.first;
  //   // String message = "Check out ${author['name']} (@${author['username']}) on Quizzo! 🚀";
  //   String message = "Share";

  //   switch (platform) {
  //     case "WhatsApp":
  //       Share.share(message, subject: "Shared via WhatsApp");
  //       break;
  //     case "Twitter":
  //       Share.share("$message #Quizzo #Quiz", subject: "Shared via Twitter");
  //       break;
  //     case "Facebook":
  //       Share.share(message, subject: "Shared via Facebook");
  //       break;
  //     case "Instagram":
  //       Share.share(message, subject: "Shared via Instagram");
  //       break;
  //     case "Yahoo":
  //       Share.share(message, subject: "Shared via Yahoo");
  //       break;
  //     case "Tiktok":
  //       Share.share(message, subject: "Shared via TikTok");
  //       break;
  //     case "Chat":
  //       Share.share(message, subject: "Shared via Chat");
  //       break;
  //     case "WeChat":
  //       Share.share(message, subject: "Shared via WeChat");
  //       break;
  //     default:
  //       Share.share(message);
  //   }
  // }

  // Show share options bottom sheet
  // void _showShareOptions() {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (BuildContext context) {
  //       return Container(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               'Share Author Profile',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: AppFontStyle().fontebold,
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             Wrap(
  //               spacing: 20,
  //               runSpacing: 20,
  //               children: [
  //                 _buildShareOption('WhatsApp', FontAwesomeIcons.whatsapp, Colors.green),
  //                 _buildShareOption('Twitter', FontAwesomeIcons.twitter, Colors.blue),
  //                 _buildShareOption('Facebook', FontAwesomeIcons.facebook, Colors.blue[800]!),
  //                 _buildShareOption('Instagram', FontAwesomeIcons.instagram, Colors.pink),
  //                 _buildShareOption('More', Icons.more_horiz, Colors.grey),
  //               ],
  //             ),
  //             const SizedBox(height: 20),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  //  Widget _buildShareOption(String platform, dynamic icon, Color color) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.pop(context);
  //       if (platform == 'More') {
  //         _shareAuthor(); // Use simple share for "More" option
  //       } else {
  //         _shareContent(platform);
  //       }
  //     },
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 50,
  //           height: 50,
  //           decoration: BoxDecoration(
  //             color: color.withOpacity(0.1),
  //             borderRadius: BorderRadius.circular(25),
  //           ),
  //           child: Icon(
  //             icon,
  //             color: color,
  //             size: 24,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           platform,
  //           style: TextStyle(
  //             fontSize: 12,
  //             fontFamily: AppFontStyle().fontebold,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 12,
          childAspectRatio: 1.4,
        ),
        itemCount: quizData.length,
        itemBuilder: (context, index) {
          return TopCollectionCard(
            name: quizData[index]['subject']!,
            imageUrl: quizData[index]['imagesb']!,
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
        const SizedBox(height: 25),
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
                  ? const Color.fromARGB(255, 122, 121, 121)
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
        padding: const EdgeInsets.all(15.0),
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

              // Stats rows
              const SizedBox(height: 8),
              _buildStatRow(statsTopRow),
              const Divider(thickness: 1),
              const SizedBox(height: 8),
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
