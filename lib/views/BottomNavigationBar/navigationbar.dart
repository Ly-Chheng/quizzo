import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/models/BottomNavigationBar/navigationbar_view_model.dart';
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
               icon: Image(
              image: AssetImage('assets/icons/quiz.png'),
              width: 30,
              height: 30,
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
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/icons/search.png',  
                  width: 28,
                  height: 28,
                ),
              ),
              IconButton(
                onPressed: () {
                },
                icon: Image.asset(
                  'assets/icons/notification.png',  
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ],
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
