import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dialog.dart';
import 'package:quizzo/widgets/custom_label.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextEditingController emailController =
      TextEditingController(text: "chamroeun@gmail.com");


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      // AppBar with back button and progress bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            FocusScope.of(context).unfocus(); // Close the keyboard
             Future.delayed(const Duration(milliseconds: 50), () {
              Get.back();
            });
          },
        ),
        
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          "Forgot Password ✏️",
                          style: TextStyle(
                              fontSize:
                                  (Get.context?.isPhone ?? true) ? 22 : 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 8 : 10,
                        ),
        
                        // Subtitle
                        Text(
                          "Enter your email address to get an OTP code. "
                          "to reset your password.",
                          style: TextStyle(
                              fontSize:
                                  (Get.context?.isPhone ?? true) ? 15 : 18,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 60,
                        ),
        
        
                        // Email
                        buildLabel("Email"),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFA63D)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFFFA63D), width: 2),
                            ),
                          ),
                        ),
        
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 40,
                        ),
        
                      
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 20),
                child: AnimatedButton(
                  width: double.infinity,
                  height: (Get.context?.isPhone ?? true) ? 50 : 60,
                  color: const Color(0xFFFFA63D),
                  borderRadius: 16,
                  shadowDegree: ShadowDegree.dark,
                  duration: 100,
                  enabled: true,
                 onPressed: () {
                    Get.toNamed('/OtpVerificationPage');
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}