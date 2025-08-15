import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/models/splash_controller.dart';
import 'package:quizzo/widgets/loading_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
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
