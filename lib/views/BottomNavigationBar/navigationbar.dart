import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/models/BottomNavigationBar/navigationbar_view_model.dart';
import 'package:quizzo/widgets/custom_drawer.dart';
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
        isLeading: false,
        title: controller.listTitle.elementAt(controller.selectedIndex),
        context: context,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            size: 30,
          ),
          onPressed: () {
            controller.scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: CustomDrawer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: Get.height * 0.18,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                child: Text(
                  'Drawer Header',
                  style: appbarTextSyle(),
                ),
              ),
            ),
            // const ChangeLanguageView(),
            // DarkModeView(),
          ],
        ),
      ),
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
