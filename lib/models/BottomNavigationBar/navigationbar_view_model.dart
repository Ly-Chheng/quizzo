import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/create/create_screen.dart';
import 'package:quizzo/views/home/home_screen.dart';
import 'package:quizzo/views/more/more.dart';
import 'package:quizzo/views/profile/profile_screen.dart';

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
    Text(
      'Library',
      style: appbarTextSyle(),
    ),
    const MoreScreen(),
    const CreateScreen(),
    const ProfileScreen(),
  ];
}
