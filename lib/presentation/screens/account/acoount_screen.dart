import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/account/account_controller.dart';
import 'package:quizzo/core/theme/app_colors.dart';
import 'package:quizzo/core/theme/app_fonts.dart';
import 'package:quizzo/core/theme/app_theme.dart';
import 'package:quizzo/presentation/widgets/animate_shimmerEffect.dart';

class AcoountScreen extends StatefulWidget {
  const AcoountScreen({
    super.key,
  });

  @override
  State<AcoountScreen> createState() => _AcoountScreenState();
}

class _AcoountScreenState extends State<AcoountScreen> {
  final controller = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
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
              _buildAuthorCard(controller.authors[0]),
              Column(
                children: [
                  Divider(
                    color: ThemeColor().borderTheme,
                    thickness: 1.3,
                  ),
                  Table(
                    border: TableBorder.symmetric(
                      inside: BorderSide(color: ThemeColor().borderTheme, width: 1.3),
                    ),
                    children: [
                      TableRow(
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                Divider(
                                  color: ThemeColor().borderTheme,
                                  thickness: 1.3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Text(
                                              '26',
                                              style: TextStyle(
                                                fontFamily: AppFontStyle().fontebold,
                                                fontSize: AppFontSize(context).titleSize,
                                              ),
                                            ),
                                            Text('Questions', style: Style.subHeaderTextStyleGray22_24(context)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.3,
                                      height: 50,
                                      color: ThemeColor().borderTheme,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Text(
                                              '8',
                                              style: TextStyle(
                                                fontFamily: AppFontStyle().fontebold,
                                                fontSize: AppFontSize(context).titleSize,
                                              ),
                                            ),
                                            Text('Played', style: Style.subHeaderTextStyleGray22_24(context)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1.3,
                                      height: 50,
                                      color: ThemeColor().borderTheme,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Column(
                                          children: [
                                            Text(
                                              '8',
                                              style: TextStyle(
                                                fontFamily: AppFontStyle().fontebold,
                                                fontSize: AppFontSize(context).titleSize,
                                              ),
                                            ),
                                            Text('Favourited', style: Style.subHeaderTextStyleGray22_24(context)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: ThemeColor().borderTheme,
                                  thickness: 1.3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: ThemeColor().borderTheme,
                    thickness: 1.3,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFA63D),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFA63D),
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        child: Text(
                          'Quizzo',
                          style: TextStyle(
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: AppFontSize(context).descriptionLargeSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFA63D),
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        child: Text(
                          'Collections',
                          style: TextStyle(
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: AppFontSize(context).descriptionLargeSize,
                            color: Color(0xFFFFA63D),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFFFA63D),
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        child: Text(
                          'About',
                          style: TextStyle(
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: AppFontSize(context).descriptionLargeSize,
                            color: Color(0xFFFFA63D),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  GestureDetector(
                    // onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '45',
                                  style: TextStyle(
                                    fontFamily: AppFontStyle().fontebold,
                                    fontSize: AppFontSize(context).titleSize,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Quizzo'.tr,
                                  style: TextStyle(
                                    fontFamily: AppFontStyle().fontebold,
                                    fontSize: AppFontSize(context).titleSize,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Newest',
                                  style: TextStyle(
                                    fontFamily: AppFontStyle().fontebold,
                                    fontSize: AppFontSize(context).subTitleSize,
                                    color: AppColors().primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.swap_vert,
                                  color: AppColors().primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    itemCount: controller.topCollectionsData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
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
                                imageUrl: controller.topCollectionsData[index]['image'],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => ShimmerEffect(),
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
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.5),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: SizedBox(
                                  child: Text(
                                    controller.topCollectionsData[index]['subject'],
                                    style: TextStyle(
                                      fontFamily: AppFontStyle().fontebold,
                                      fontSize: AppFontSize(context).subTitleSize,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthorCard(authors) {
    final bool isFollowing = authors['isFollowing'] ?? false;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[700] : Colors.grey[300],
            backgroundImage: authors['profileImageUrl'] != null ? NetworkImage(authors['profileImageUrl']) : null,
            child: authors['profileImageUrl'] == null
                ? Text(
                    authors['name'][0].toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
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
                      authors['name'],
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
                  '@${authors['username']}',
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
            onTap: () => controller.toggleFollow(authors['id']),
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
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
