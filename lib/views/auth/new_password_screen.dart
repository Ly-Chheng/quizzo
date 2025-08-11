import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_auth.dart';
import 'package:quizzo/widgets/custom_dialog.dart';
import 'package:quizzo/widgets/custom_label.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {

  final TextEditingController passwordController =
      TextEditingController(text: "12345678");

  bool rememberMe = true;
  bool passwordVisible = false;
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
            // Get.back(); // Go back instead of pushing new route
             Future.delayed(const Duration(milliseconds: 50), () {
              Get.back();
            });
          },
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: 1.0,
            minHeight: (Get.context?.isPhone ?? true) ? 10 : 12,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFFFFA63D),
            ),
          ),
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
                        Center(
                          child: Text(
                            "Create an account ✏️",
                            style: TextStyle(
                                fontSize:
                                    (Get.context?.isPhone ?? true) ? 22 : 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 8 : 10,
                        ),
        
                        // Subtitle
                        Center(
                          child: Text(
                            "Please enter your username, email address and password. "
                            "If you forget it, then you have to do forgot password.",
                            style: TextStyle(
                                fontSize:
                                    (Get.context?.isPhone ?? true) ? 15 : 18,
                                color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 60,
                        ),
        
                      
        
                        // Password
                        buildLabel("Create a new password"),
                        PasswordField(
                          controller: passwordController,
                          hintText: 'Enter password',
                        ),
        
                        const SizedBox(height: 10),
        
                        // Remember me
                        Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFFFA63D),
                              value: rememberMe,
                              onChanged: (value) =>
                                  setState(() => rememberMe = value ?? false),
                            ),
                            const Text("Remember me"),
                          ],
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 40,
                        ),
        
                      
                        const SizedBox(height: 15),
        
                       
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
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const SuccessDialog(),
                    );

                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pop(context); // Close dialog
                      Get.toNamed('/BottomNavigationBar');
                    });
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