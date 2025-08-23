import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dialog.dart';
import 'package:quizzo/widgets/custom_auth.dart';
import 'package:url_launcher/url_launcher.dart';

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
                             style: Style.bodyText16_18(context),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: (Get.context?.isPhone ?? true) ? 30 : 60,
                        ),
        
                      
                        // Normal text field
                        CustomUnderlineInput(
                          controller: TextEditingController(),
                          labelText: "Username",
                          isRequired: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        
                         CustomUnderlineInput(
                          controller: emailController,
                          labelText: "Email",
                          isRequired: true,
                        ),
                       
                       SizedBox(
                          height: 20,
                        ),
                        
                        // Password field
                        CustomUnderlineInput(
                          controller: passwordController,
                          labelText: "Password",
                          isRequired: true,
                          isPassword: true,
                          underlineColor: Colors.orange,
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
                  borderRadius: 25,
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
                      Get.offAllNamed('/BottomNavigationBar');
                    });
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



  Widget _buildSocialButton({required String icon, required String text}) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        minimumSize: Size(
          double.infinity,
          (Get.context?.isPhone ?? true) ? 50 : 60,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
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
      onPressed: () async {
        final gmailUrl = Uri.parse("googlegmail://");
        final mailtoUrl = Uri.parse("mailto:");

        if (await canLaunchUrl(gmailUrl)) {
          await launchUrl(gmailUrl);
        } else if (await canLaunchUrl(mailtoUrl)) {
          await launchUrl(mailtoUrl);
        } else {
          Get.snackbar('Error', 'Could not open Gmail app or email client.');
        }
      },
    );
  }
}
