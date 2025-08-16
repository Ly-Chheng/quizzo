import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/collection_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/custom_section_title.dart';

class SubCollectionTab extends StatefulWidget {
  const SubCollectionTab({super.key});

  @override
  State<SubCollectionTab> createState() => _SubCollectionTabState();
}

class _SubCollectionTabState extends State<SubCollectionTab> {
  @override
  Widget build(BuildContext context) {
    final colController = Get.put(CollectionController());
    return Scaffold(
      body: Column(
        children: [
          SectionTitle(
            count: 7,
            title: ' Collection'.tr,
            icon: Icon(
              Icons.swap_vert,
              color: AppColor().primaryColor,
            ),
            onTap: () {},
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 11,
                childAspectRatio: 1.4,
              ),
              itemCount: colController.collectionData.length,
              itemBuilder: (context, index) {
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
                          imageUrl: colController.collectionData[index]
                              ['imagesb']!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[300],
                            child: const Center(
                                child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),
                            );
                          },
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
                          child: Text(
                            colController.collectionData[index]['subject']!,
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
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 241, 153, 53),
              blurRadius: 0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          shape: const CircleBorder(),
          backgroundColor: AppColor().primaryColor,
          child: Icon(
            Icons.add,
            size: Get.context!.isPhone ? 32 : 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
