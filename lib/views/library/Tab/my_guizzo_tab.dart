import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_color.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/views/library/sub_tab_quizzo/sub_collection.dart';
import 'package:quizzo/views/library/sub_tab_quizzo/sub_quizzo_tab.dart';

class MyGuizzoTab extends StatefulWidget {
  const MyGuizzoTab({super.key});

  @override
  State<MyGuizzoTab> createState() => _MyGuizzoTabState();
}

class _MyGuizzoTabState extends State<MyGuizzoTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _selectedIndex == 0
                            ? AppColor().primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: AppColor().primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Quizzo'.tr,
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? AppColor().white
                                : AppColor().primaryColor,
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: context.isPhone ? 14 : 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _selectedIndex == 1
                            ? AppColor().primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: AppColor().primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Collections'.tr,
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? AppColor().white
                                : AppColor().primaryColor,
                            fontFamily: AppFontStyle().fontebold,
                            fontSize: context.isPhone ? 14 : 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  SubQuizzoTab(),
                  SubCollectionTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
