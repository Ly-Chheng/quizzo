import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_auth.dart';
import 'package:quizzo/widgets/custom_dialog.dart';
import 'package:quizzo/widgets/custom_label.dart';

class HaveAccountScreen extends StatefulWidget {
  const HaveAccountScreen({super.key});

  @override
  State<HaveAccountScreen> createState() => _HaveAccountScreenState();
}

class _HaveAccountScreenState extends State<HaveAccountScreen> {

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            FocusScope.of(context).unfocus(); 
             Future.delayed(const Duration(milliseconds: 50), () {
              Get.offAllNamed('/HaveAccountScreen'); 
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
                          "Hello there ✏️",
                          style: TextStyle(
                              fontSize:
                                  (Get.context?.isPhone ?? true) ? 22 : 25,
                              fontWeight: FontWeight.bold),
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
        
                        // Password
                        buildLabel("Password"),
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
                          ],
                        ),
                        const SizedBox(height: 15),
        
                       Center(child: TextButton(onPressed: (){
                        Get.toNamed('/ForgotPasswordScreen');
                       }, child: Text("Forgot Password?",
                        style: TextStyle(
                      fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,
                      color: const Color(0xFFFFA63D),
                      fontWeight: FontWeight.w600,
                    ),
                       )))
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
            
                  },
                  child: Text(
                    "Sign In",
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