import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/presentation/widgets/loading_screen.dart';
import 'package:quizzo/presentation/widgets/navigation_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Get.off(const BottomNavigationBarScreen()),
    );
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icons/quiz.png'),
              width: 170,
              height: 170,
            ),
            Text(
              "Qiuzzo",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 150),
            RotatingDotsLoader()
          ],
        ),
      ),
    );
  }
}
