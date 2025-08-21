import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/views/library/library_page.dart';
import 'package:quizzo/views/create/create_screen.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/views/join_game/join_game_screen.dart';
import 'package:quizzo/views/profile/more.dart';

class BottomNavigationBarController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List listTitle = [
    'Quizzo',
    'Library',
    'More',
    'Create',
    'Profile',
  ];
  List screenWidget = [
    const MyHomePage(),
    const LibraryPage(),
    const JoinGameScreen(),
    const CreateScreen(),
    const MoreScreen(),
  ];
}
