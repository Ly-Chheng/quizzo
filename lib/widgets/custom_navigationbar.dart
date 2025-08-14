import 'package:flutter/material.dart';
import 'package:quizzo/core/utils/app_fonts.dart';

customNavigationBar({
  final List<BottomNavigationBarItem>? items,
  required final int currentIndex,
  final Color? selectedItemColor,
  final Color? unselectedItemColor,
  final void Function(int)? onTap,
}) {
  return BottomNavigationBar(
    items: items ??
        const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),  
            activeIcon: Icon(Icons.home), 
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            activeIcon: Icon(Icons.widgets),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            // icon: Icon(Icons.quiz_outlined),
            icon: Image(
              image: AssetImage('assets/icons/quiz.png'),
              width: 25,
              height: 25,
            ),
            // activeIcon: Icon(Icons.quiz),
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
            label: 'Prfile',
          ),
        ],
    currentIndex: currentIndex,
    selectedItemColor: selectedItemColor ?? const Color(0xFFFFA63D),
    unselectedItemColor: unselectedItemColor ?? Colors.grey.shade600,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    elevation: 10,
    showUnselectedLabels: true,
    selectedLabelStyle:   TextStyle(fontFamily: AppFontStyle().fontebold,fontSize: 13),
    unselectedLabelStyle:  TextStyle( fontFamily: AppFontStyle().fontBold,fontSize: 12),
    onTap: onTap,
  );
}

 