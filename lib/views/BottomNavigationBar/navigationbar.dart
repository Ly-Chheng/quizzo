import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/models/BottomNavigationBar/navigationbar_view_model.dart';
import 'package:quizzo/widgets/custom_appbar.dart';
import 'package:quizzo/widgets/custom_navigationbar.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
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
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: customAppBar(
        backgroundColor: Colors.white,
        isLeading: false,
        title: controller.listTitle.elementAt(controller.selectedIndex),
        context: context,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.quiz,
                size: 40,
                color: Color(0xFFFFA63D),
              ),
              onPressed: () {
                // controller.scaffoldKey.currentState?.openDrawer();
              },
            ),
            
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){},  icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),),
              IconButton(
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                
                },
              ),
            ],
          ),
        ],
      ),
      // drawer: CustomDrawer(
      //   child: ListView(
      //     physics: const NeverScrollableScrollPhysics(),
      //     padding: EdgeInsets.zero,
      //     children: [
      //       SizedBox(
      //         height: Get.height * 0.18,
      //         child: DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Theme.of(context).colorScheme.inversePrimary,
      //           ),
      //           child: Text(
      //             'Drawer Header',
      //             style: appbarTextSyle(),
      //           ),
      //         ),
      //       ),
      //       // const ChangeLanguageView(),
      //       // DarkModeView(),
      //     ],
      //   ),
      // ),
      body: Center(
        child: controller.screenWidget.elementAt(controller.selectedIndex),
      ),
      bottomNavigationBar: customNavigationBar(
        currentIndex: controller.selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
