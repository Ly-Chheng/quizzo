import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dialog.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String currentText = "";
  int countdown = 55;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
             Text(
              "You've got mail 📩",
              style: TextStyle(fontSize: (Get.context?.isPhone ?? true) ? 20 : 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
              Text(
              "We have sent the OTP verification code to your email address. "
              "Check your email and enter the code below.",
              style: TextStyle(fontSize: (Get.context?.isPhone ?? true) ? 14 : 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),

            /// OTP Text Fields
            PinCodeTextField(
              appContext: context,
              length: 4,
              onChanged: (value) => setState(() => currentText = value),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeColor: Color(0xFFFFA63D),
                selectedColor: Color(0xFFFFA63D),
                inactiveColor: Colors.grey.shade300,
                fieldHeight: (Get.context?.isPhone ?? true) ? 50 : 70,
                fieldWidth: (Get.context?.isPhone ?? true) ? 60 : 80,
              ),
              keyboardType: TextInputType.number,
              enableActiveFill: true,
            ),

            SizedBox(height: (Get.context?.isPhone ?? true) ? 20 : 40,),
            Center(
              child: Text(
                "Didn't receive email?",
                style: TextStyle(fontSize: (Get.context?.isPhone ?? true) ? 16 : 18, color: Colors.black87),
              ),
            ),
            SizedBox(height: (Get.context?.isPhone ?? true) ? 5 : 15,),
            Center(
              child: Text(
                countdown > 0
                    ? "You can resend code in $countdown s"
                    : "Resend code",
                style: TextStyle(
                  fontSize: (Get.context?.isPhone ?? true) ? 14 : 16,
                  color: countdown > 0 ? Colors.black54 : Color(0xFFFFA63D),
                  fontWeight:
                      countdown > 0 ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),

            /// Confirm Button
            // SizedBox(
            //   width: double.infinity,
            //   height: (Get.context?.isPhone ?? true) ? 50 : 60,
            //   child: ElevatedButton(
            //     onPressed: currentText.length == 4
            //         ? () {
            //             showDialog(
            //               context: context,
            //               barrierDismissible: false,
            //               builder: (context) => const SuccessDialog(),
            //             );

            //             Future.delayed(const Duration(seconds: 2), () {
            //               Navigator.pop(context); // Close dialog
            //               Get.toNamed('/NewPassword');
            //             });
            //           }
            //         : null, // Disable when less than 4
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color(0xFFFFA63D),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(28),
            //       ),
            //     ),
            //     child: Text(
            //       "Confirm",
            //       style: TextStyle(
            //         fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),

          AnimatedButton(
            width: double.infinity,
            height: (Get.context?.isPhone ?? true) ? 50 : 60,
            borderRadius: 16,
            shadowDegree: ShadowDegree.dark,
            duration: 100,
            enabled: currentText.length == 4, 
            onPressed: () {
              if (currentText.length != 4) return; // Prevent action if not 4 digits

              // showDialog(
              //   context: context,
              //   barrierDismissible: false,
              //   builder: (context) => const SuccessDialog(),
              // );

              // Future.delayed(const Duration(seconds: 2), () {
              //   Navigator.pop(context); // Close dialog
                Get.toNamed('/NewPassword');
              // });
            },
            child: Text(
              "Confirm",
              style: TextStyle(
                fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: currentText.length == 4 ?   Color(0xFFFFFFFF) : Colors.grey[400], // Disabled look
              ),
            ),
          color: currentText.length == 4 ? const Color(0xFFFFA63D) : Colors.grey.shade200, // Disabled background
        ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
