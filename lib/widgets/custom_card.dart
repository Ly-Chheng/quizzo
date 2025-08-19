import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/animate_shimmerEffect.dart';

Widget quizCard({
  required BuildContext context,
  required String imageUrl,
  required String title,
  required String questionCount,
  required String name,
  required String date,
  String? view,
  required String profileUrl,
  Widget? profileWidget,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppTheme().cardTheme,
      border: Border.all(
        color: AppTheme().borderTheme,
      ),
    ),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      imageUrl,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => ShimmerEffect(),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/no_picture.png',
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColor().primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    questionCount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Get.context!.isPhone ? 12 : 1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito-Regular',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: AppFontStyle().fontebold,
                    fontSize: AppFontSize(context).subTitleSize,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        fontSize: AppFontSize(context).subNormalSize,
                        color: AppColor().secondaryText,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          color: Theme.of(context).iconTheme.color,
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      view ?? "",
                      style: TextStyle(
                        fontFamily: 'Nunito-Regular',
                        fontSize: AppFontSize(context).subNormalSize,
                        color: AppColor().secondaryText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                profileWidget ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 11,
                          backgroundImage: NetworkImage(profileUrl),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Nunito-Regular',
                            fontSize: Get.context!.isPhone ? 12 : 14,
                            color: AppColor().secondaryText,
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
