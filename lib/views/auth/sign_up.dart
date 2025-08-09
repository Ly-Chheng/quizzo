import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dialog.dart';
import 'package:quizzo/widgets/custom_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController =
      TextEditingController(text: "Chamroeun");
  final TextEditingController emailController =
      TextEditingController(text: "chamroeun@gmail.com");
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
        
                        // Username
                        _buildLabel("Username"),
                        CustomUnderlineTextField(
                          controller: usernameController,
                          hintText: 'Enter username',
                          suffixIcon: Icons.check,
                        ),
        
                        // Email
                        _buildLabel("Email"),
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
        
                        // Password
                        _buildLabel("Password"),
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
        
                        // Divider with OR
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.grey.shade400)),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("or"),
                            ),
                            Expanded(child: Divider(color: Colors.grey.shade400)),
                          ],
                        ),
                        const SizedBox(height: 15),
        
                        // Google button
                        _buildSocialButton(
                          icon: "assets/icons/google.png",
                          text: "Continue with Google",
                        ),
        
                        // const Spacer(),
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
                  },
                  child: Text(
                    "Sign up",
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

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: (Get.context?.isPhone ?? true) ? 14 : 16,
        ),
      ),
    );
  }

  Widget _buildSocialButton({required String icon, required String text}) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        minimumSize: Size(
          double.infinity,
          (Get.context?.isPhone ?? true) ? 50 : 60,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Image.asset(icon, height: (Get.context?.isPhone ?? true) ? 24 : 35, width: (Get.context?.isPhone ?? true) ? 24 : 35,),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
        ),
      ),
      onPressed: () {
        // Get.toNamed('/CreateAccountPage');
      },
    );
  }
}
