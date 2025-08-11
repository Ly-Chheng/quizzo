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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool rememberMe = true;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool _validatePasswords() {
    if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      _showErrorDialog("Please fill in both password fields");
      return false;
    }
    
    if (passwordController.text.length < 8) {
      _showErrorDialog("Password must be at least 8 characters long");
      return false;
    }
    
    if (passwordController.text != confirmPasswordController.text) {
      _showErrorDialog("Passwords do not match");
      return false;
    }
    
    return true;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
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
            FocusScope.of(context).unfocus();
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
                        Text(
                          "Create new password ✏️",
                          style: TextStyle(
                            fontSize: (Get.context?.isPhone ?? true) ? 22 : 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 8 : 10,
                        ),

                        // Subtitle (fixed the duplicate text)
                        Text(
                          "Save the new password in a safe place. "
                          "If you forget it, then you have to do forgot password again.",
                          style: TextStyle(
                            fontSize: (Get.context?.isPhone ?? true) ? 15 : 18,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 60,
                        ),

                        // Password
                        buildLabel("Create a new password"),
                        PasswordField(
                          controller: passwordController,
                          hintText: 'Enter new password',
                        ),
                        const SizedBox(height: 15),
                        
                        // Confirm Password (now uses separate controller)
                        buildLabel("Confirm new password"),
                        PasswordField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm new password',
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
                            Text("Remember me",style: TextStyle(fontSize: (Get.context?.isPhone ?? true) ? 14 : 16,),),
                          ],
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
                  color: const Color(0xFFFFA63D),
                  borderRadius: 16,
                  shadowDegree: ShadowDegree.dark,
                  duration: 100,
                  enabled: true,
                  onPressed: () {
                    // Validate passwords before proceeding
                    if (_validatePasswords()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const SuccessDialog(),
                      );

                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pop(context); // Close dialog
                        Get.toNamed('/BottomNavigationBar');
                      });
                    }
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