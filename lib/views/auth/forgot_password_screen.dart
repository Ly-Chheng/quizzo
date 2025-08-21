import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_auth.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  // final TextEditingController emailController =
  //     TextEditingController(text: "chamroeun@gmail.com");
  final TextEditingController emailController = TextEditingController();
  bool isFormValid = false; 


   @override
  void initState() {
    super.initState();
    // Listen for changes
    emailController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isFormValid = emailController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.removeListener(_validateForm);
    emailController.dispose();
    super.dispose();
  }


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
                          "Forgot Password",
                          style: Style.headerTextStyleBold22_24(context),
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
        
        
                        CustomUnderlineInput(
                          controller: emailController,
                          labelText: "Email",
                          isRequired: true,
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
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: AnimatedButton(
                  width: double.infinity,
                  height: (Get.context?.isPhone ?? true) ? 50 : 60,
                  color: isFormValid ? const Color(0xFFFFA63D) : Colors.grey,
                  borderRadius: 16,
                  shadowDegree: ShadowDegree.dark,
                  duration: 100,
                  enabled: isFormValid,
                  onPressed: () {
                    if (!isFormValid) return;
                    // Your sign-in logic here
                    log('Email: ${emailController.text}');
                    Get.toNamed('/OtpVerificationPage');
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                      color: isFormValid ?   Color(0xFFFFFFFF) : Colors.grey[400],
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