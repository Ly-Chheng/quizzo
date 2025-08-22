import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/constants/assets.dart';
import 'package:quizzo/core/theme/app_colors.dart';
import 'package:quizzo/core/theme/app_fonts.dart';
import 'package:quizzo/presentation/routes/app_routes.dart';
import 'package:quizzo/presentation/widgets/custom_appbar.dart';
import 'package:quizzo/presentation/widgets/custom_navigationbar.dart';
import 'package:quizzo/presentation/screens/home/home_screen.dart';
import 'package:quizzo/presentation/screens/library/library_screen.dart';
import 'package:quizzo/presentation/screens/create/create_screen.dart';
import 'package:quizzo/presentation/screens/join/join_screen.dart';
import 'package:quizzo/presentation/screens/account/acoount_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List listTitle = [
    'Quizzo'.toUpperCase(),
    'Library'.toUpperCase(),
    'Join'.toUpperCase(),
    'Create'.toUpperCase(),
    'Profile'.toUpperCase(),
  ];
  List screenWidget = [
    const HomeScreen(),
    const LibraryScreen(),
    const JoinScreen(),
    const CreateScreen(),
    const AcoountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(20)),
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
        key: scaffoldKey,
        appBar: CustomAppBar(
          isLeading: false,
          title: listTitle.elementAt(selectedIndex),
          context: context,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage(AppAssets.quizIcon),
              width: Get.context!.isPhone ? 35 : 40,
              height: Get.context!.isPhone ? 35 : 40,
            ),
          ),
          actions: [
            if (selectedIndex == 0)
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: ThemeColor().iconTheme,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      size: 30,
                      color: ThemeColor().iconTheme,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            else if (selectedIndex == 1)
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: ThemeColor().iconTheme,
                ),
                onPressed: () {},
              )
            else if (selectedIndex == 4)
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.send_rounded,
                      size: 30,
                      color: ThemeColor().iconTheme,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: ThemeColor().iconTheme,
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.setting);
                    },
                  ),
                ],
              )
          ],
        ),
        body: Center(
          child: screenWidget.elementAt(selectedIndex),
        ),
        bottomNavigationBar: customNavigationBar(
          context: context,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
