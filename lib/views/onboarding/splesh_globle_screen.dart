import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/views/BottomNavigationBar/navigationbar.dart';
import 'package:quizzo/widgets/loading_screen.dart';

class SpleshGlobleScreen extends StatefulWidget {
  const SpleshGlobleScreen({super.key});

  @override
  State<SpleshGlobleScreen> createState() => _SpleshGlobleScreenState();
}

class _SpleshGlobleScreenState extends State<SpleshGlobleScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Get.off(() => const BottomNavigationBarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/quiz.png'),
              width:170,
              height: 170,
            ),
            
            const Text(
              "Qiuzzo",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 150),
            const RotatingDotsLoader(),
          ],
        ),
      ),
    );
  }
}
