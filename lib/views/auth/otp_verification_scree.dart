import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              "You've got mail 📩",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "We have sent the OTP verification code to your email address. "
              "Check your email and enter the code below.",
              style: TextStyle(fontSize: 14, color: Colors.black54),
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
                activeColor: Colors.deepPurple,
                selectedColor: Colors.deepPurple,
                inactiveColor: Colors.grey.shade300,
                fieldHeight: 60,
                fieldWidth: 50,
              ),
              keyboardType: TextInputType.number,
              enableActiveFill: true,
            ),

            const SizedBox(height: 16),
            Center(
              child: Text(
                "Didn't receive email?",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                countdown > 0
                    ? "You can resend code in $countdown s"
                    : "Resend code",
                style: TextStyle(
                  fontSize: 14,
                  color: countdown > 0 ? Colors.black54 : Colors.deepPurple,
                  fontWeight:
                      countdown > 0 ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),

            /// Confirm Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: currentText.length == 4 ? () {} : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A4DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
