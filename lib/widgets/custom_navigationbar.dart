import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

customNavigationBar({
  final List<BottomNavigationBarItem>? items,
  required final int currentIndex,
  final Color? selectedItemColor,
  final Color? unselectedItemColor,
  final void Function(int)? onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).scaffoldBackgroundColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      border: Border.all(
        color: Theme.of(Get.context!).cardColor,
        width: 1,
      ),
      boxShadow: currentIndex == 0
          ? [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                offset: Offset(2, 4),
              ),
            ]
          : [],
    ),
    child: BottomNavigationBar(
      items: items ??
          <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined),
              activeIcon: Icon(Icons.widgets),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('assets/icons/quiz.png'),
                width: 25,
                height: 25,
              ),
              label: 'Join',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              activeIcon: Icon(Icons.add_box),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor ?? const Color(0xFFFFA63D),
      unselectedItemColor: unselectedItemColor ?? Colors.grey.shade600,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle:
          TextStyle(fontFamily: AppFontStyle().fontebold, fontSize: 13),
      unselectedLabelStyle:
          TextStyle(fontFamily: AppFontStyle().fontebold, fontSize: 12),
      onTap: onTap,
    ),
  );
}
