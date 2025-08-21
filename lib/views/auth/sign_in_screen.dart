import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

    final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool rememberMe = true;
  bool passwordVisible = false;
  bool isFormValid = false; // Track form validity

  @override
  void initState() {
    super.initState();
    // Listen for changes
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      isFormValid = emailController.text.trim().isNotEmpty &&
          passwordController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.removeListener(_validateForm);
    passwordController.removeListener(_validateForm);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar with back button and progress bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          "Hello there ✏️",
                           style: Style.headerTextStyleBold22_24(context),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 60,
                        ),
                        CustomUnderlineInput(
                          controller: emailController,
                          labelText: "Email",
                          isRequired: true,
                        ),

                        const SizedBox(height: 20),
                        // Password field
                        CustomUnderlineInput(
                          controller: passwordController,
                          labelText: "Password",
                          isPassword: true,
                          isRequired: true,
                          underlineColor: Color(0xFFFFA63D),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 40,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              
                              children: [
                                Checkbox(
                                  activeColor: const Color(0xFFFFA63D),
                                  value: rememberMe,
                                  onChanged: (value) => setState(
                                      () => rememberMe = value ?? false),
                                ),
                                const Text("Remember me"),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/ForgotPasswordScreen');
                              },
                              child: Text(
                                "Forgot Password?",
                                 style: Style.bodyText16_18(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont't have an account ?"),
                            TextButton(onPressed: (){
                              Get.offAllNamed('/accountType');
                            }, child: Text("Sing Up",  style: Style.bodyText16_18(context),),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Sign In Button
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: AnimatedButton(
                  width: double.infinity,
                  height: (Get.context?.isPhone ?? true) ? 50 : 60,
                  color: isFormValid ? Color(0xFFFFA63D) : Colors.grey,
                  borderRadius: 16,
                  shadowDegree: ShadowDegree.dark,
                  duration: 100,
                  enabled: isFormValid,
                  onPressed: () {
                    if (!isFormValid) return;
                    log('Email: ${emailController.text}');
                    log('Password: ${passwordController.text}');
                    log('Remember Me: $rememberMe');
                    Get.offAllNamed('/BottomNavigationBar');
                  },
                  child: Text(
                    "Sign In",
                    // style: TextStyle(
                    //   fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                    //   color: isFormValid
                    //       ? const Color(0xFFFFFFFF)
                    //       : Colors.grey[400],
                    //   fontWeight: FontWeight.w600,
                    // ),
                     style: Style.bodyText16_18(context),
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