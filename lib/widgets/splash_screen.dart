import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quizzo/models/splash_controller.dart';

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
            Icon(Icons.quiz,size: 200,color: Color(0xFFFFA63D),),
            Text("Qiuzzo",style: TextStyle(fontSize: 40,fontWeight:FontWeight.bold),),
            const SizedBox(height: 150),
            const CircularProgressIndicator(strokeWidth: 5,color: Color(0xFFFFA63D),),
          ],
          
        ),
      ),
    );
  }
}
