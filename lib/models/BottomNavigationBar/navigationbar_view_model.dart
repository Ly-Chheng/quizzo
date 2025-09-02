import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/views/library/library_page.dart';
import 'package:quizzo/views/create/create_screen.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/views/more/join_game_screen.dart';
import 'package:quizzo/views/more/more.dart';

class BottomNavigationBarController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List listTitle = [
    'Quizzo'.tr,
    'library'.tr,
    'More'.tr,
    'create'.tr,
    'profile'.tr,
  ];
  List screenWidget = [
    const MyHomePage(),
    const LibraryPage(),
    const JoinGameScreen(),
    const CreateScreen(),
    const MoreScreen()
  ];
}
