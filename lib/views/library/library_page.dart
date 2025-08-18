import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/Library/Tab/collaborate_tab.dart';
import 'package:quizzo/views/library/Tab/favorite_tab.dart';
import 'package:quizzo/views/library/Tab/my_guizzo_tab.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: context.isPhone ? 10 : 15,
            right: context.isPhone ? 10 : 15,
          ),
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColor().primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                labelColor: AppColor().primaryColor,
                indicatorPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  height: 1.5,
                  color: Theme.of(context).hoverColor,
                  fontFamily: AppFonts().fontEngBold,
                  fontSize: context.isPhone ? 14 : 16,
                ),
                tabs: [
                  Tab(text: 'My Quizzo'.tr),
                  Tab(text: 'Favorites'.tr),
                  Tab(text: 'Collaboration'.tr),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    MyGuizzoTab(),
                    FavoriteTab(),
                    CollaborateTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
