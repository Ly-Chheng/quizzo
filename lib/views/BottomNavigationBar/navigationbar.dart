import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/models/BottomNavigationBar/navigationbar_view_model.dart';
import 'package:quizzo/views/home/search/search_screen.dart';
import 'package:quizzo/widgets/custom_appbar.dart';
import 'package:quizzo/widgets/custom_navigationbar.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final controller = Get.put(BottomNavigationBarController());

  void _onItemTapped(int index) {
    setState(() {
      controller.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: ((didPop, result) async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              icon: Icon(
                Icons.warning,
                color: Colors.red,
                size: 60,
              ),
              content: SizedBox(
                height: 50,
                child: Center(
                    child: Text(
                  "Are you sure you want to exit the app?".tr,
                  textAlign: TextAlign.center,
                )),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Yes".tr,
                                style: TextStyle(
                                  fontFamily: AppFontStyle().fontRegular,
                                  fontSize: AppFontSize(context).normalTextSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          SystemNavigator.pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Yes".tr,
                                style: TextStyle(
                                  fontFamily: AppFontStyle().fontRegular,
                                  fontSize: AppFontSize(context).normalTextSize,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      }),
      child: Scaffold(
        key: controller.scaffoldKey,
        appBar: customAppBar(
          isLeading: false,
          title: controller.listTitle.elementAt(controller.selectedIndex),
          context: context,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                IconButton(
                  icon: Image(
                    image: AssetImage('assets/icons/quiz.png'),
                    width: Get.context!.isPhone ? 35 : 40,
                    height: Get.context!.isPhone ? 35 : 40,
                  ),
                  onPressed: () {
                    // controller.scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                if (controller.selectedIndex != 1 &&
                    controller.selectedIndex != 2)
                  IconButton(
                    onPressed: () {
                      Get.to(SearchScreen());
                    },
                    icon: Image.asset(
                      'assets/icons/search.png',
                      width: 28,
                      height: 28,
                      color: theme.iconTheme,
                    ),
                  ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/notification.png',
                    width: 24,
                    height: 24,
                    color: theme.iconTheme,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: controller.screenWidget.elementAt(controller.selectedIndex),
        ),
        // bottomNavigationBar: customNavigationBar(
          
        //   currentIndex: controller.selectedIndex,
        //   onTap: _onItemTapped,
        // ),
        bottomNavigationBar:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  color: theme.skeletonbaseColorTheme,
                  thickness: 1,
                ),
                customNavigationBar(
                 currentIndex: controller.selectedIndex,
                  onTap: _onItemTapped,
                ),
              ],
        )
      ),
    );
  }
}
