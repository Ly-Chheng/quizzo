import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

class FindFriendsScreen extends StatefulWidget {
  const FindFriendsScreen({super.key});

  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  final people = [
    {
      'name': 'Darron Kulikowski',
      'avatarColor': Color(0XFFFF947A),
      'imageUrl': 'assets/icons/avatar1.png',
    },
    {
      'name': 'Maryland Winkles',
      'avatarColor': const Color.fromARGB(255, 238, 229, 151),
      'imageUrl': 'assets/icons/avatar2.png',
    },
    {
      'name': 'Lauralee Quintero',
      'avatarColor': const Color.fromARGB(255, 235, 137, 170),
      'imageUrl': 'assets/icons/avatar3.png',
    },
    {
      'name': 'Alfonzo Schuessler',
      'avatarColor': const Color.fromARGB(255, 75, 38, 22),
      'imageUrl': 'assets/icons/avatar4.png',
    },
  ];
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
          'Find Friends',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
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
                contentPadding: EdgeInsets.all(15),
                filled: true,
                fillColor: theme.fillColor,
                hintText: 'Search email, name, or phone number',
                hintStyle: TextStyle(
                    fontFamily: AppFontStyle().fontBold,
                    fontSize: AppFontSize(context).normalTextSize,
                    color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.context!.isDarkMode
                          ? Color(0xff272B36)
                          : Color(0XFFFFFFFF)),
                  borderRadius: BorderRadius.circular(10.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.context!.isDarkMode
                          ? Color(0xff272B36)
                          : Color(0XFFFFFFFF)),
                  borderRadius: BorderRadius.circular(15),
                ),
              )),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.cardTheme,
                  boxShadow: [
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                    const BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                    BoxShadow(
                      color: Get.context!.isDarkMode
                          ? Color(0xff272B36)
                          : Color.fromARGB(2255, 229, 226, 226),
                      blurRadius: 0,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _buildOptionTile(
                      icon: Icons.plagiarism,
                      iconColor: Colors.blue,
                      title: "Search Contact",
                      subtitle: "Find friends by phone number",
                      onTap: () {},
                    ),
                    Divider(
                      color: theme.skeletonbaseColorTheme,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _buildOptionTile(
                      icon: Icons.facebook_rounded,
                      iconColor: Colors.blue[800]!,
                      title: "Connect to Facebook",
                      subtitle: "Find contacts via Facebook",
                      onTap: () {},
                    ),
                    Divider(
                      color: theme.skeletonbaseColorTheme,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    _buildOptionTile(
                      icon: Icons.group_add,
                      iconColor: Colors.brown,
                      title: "Invite Friends",
                      subtitle: "Invite friends to play together",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildSectionTitle("People you many know"),
              Column(
                children: people.map((person) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: person['avatarColor'] as Color,
                          radius: 22,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipOval(
                              child: Image.asset(
                                person['imageUrl'] as String,
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            person['name'] as String,
                            style: TextStyle(
                              fontFamily: AppFontStyle().fontebold,
                              fontSize: AppFontSize(context).subTitleSize,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppFontStyle().fontebold,
                                fontSize: AppFontSize(context).subNormalSize,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          icon,
          color: iconColor,
          size: 50,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: AppFontStyle().fontebold,
            fontSize: AppFontSize(context).subTitleSize,
          ),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          subtitle,
          style: TextStyle(
            fontFamily: AppFontStyle().fontRegular,
            fontSize: AppFontSize(context).subNormalSize,
          ),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Get.isDarkMode
            ? Colors.grey[500]!
            : Color.fromARGB(255, 233, 235, 237),
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }

  Widget _buildSectionTitle(String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: AppFontStyle().fontebold,
                  fontSize: AppFontSize(context).titleSize,
                ),
              ),
              Row(
                children: [
                  Text(
                    "View all",
                    style: TextStyle(
                      fontFamily: AppFontStyle().fontebold,
                      fontSize: AppFontSize(context).normalTextSize,
                      color: Color(0xFFFFA63D),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/icons/next.png',
                    width: 20,
                    height: 20,
                    color: Color(0xFFFFA63D),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
