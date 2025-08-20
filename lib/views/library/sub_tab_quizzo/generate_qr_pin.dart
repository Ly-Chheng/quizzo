import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quizzo/widgets/custom_appbar.dart';

class GenerateQRPinCode extends StatelessWidget {
  final String pinCode = '465 789';

  const GenerateQRPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Generate PIN & QR Code",
        context: context,
        isLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            QrImageView(
              data: pinCode,
              version: QrVersions.auto,
              size: Get.context!.isPhone ? Get.width * 0.8 : Get.width * 0.3,
              backgroundColor: const Color.fromARGB(255, 249, 246, 246),
              padding: EdgeInsets.all(40),
            ),
            SizedBox(height: 20),

            // PIN Text
            Text(
              pinCode,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tap code to copy',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 30),

            // Description Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'PIN & QR Code are unique and different for each player, you can invite your friends to play quizzes on one server with the code above.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
