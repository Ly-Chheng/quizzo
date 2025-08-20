import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/library/collection_controller.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/views/home/component/top_collection_card.dart';
import 'package:quizzo/views/library/sub_tab_quizzo/create_collection.dart';
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
            title: ' Collections'.tr,
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
                crossAxisSpacing: 12,
                childAspectRatio: 1.4,
              ),
              itemCount: colController.collectionData.length,
              itemBuilder: (context, index) {
                return TopCollectionCard(
                  name: colController.collectionData[index]['name']!,
                  imageUrl: colController.collectionData[index]['imagesb']!,
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  initialChildSize: 1,
                  expand: false,
                  builder: (context, scrollController) {
                    return CreateCollection(
                      scrollController: scrollController,
                    );
                  },
                );
              },
            );
          },
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
