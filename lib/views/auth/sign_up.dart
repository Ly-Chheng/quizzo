import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_dialog.dart';

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
      body: SafeArea(
  child: SingleChildScrollView(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button & Progress Bar
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.toNamed('/CreateAccountPage');
              },
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 1.0,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFFFA63D),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Title
        const Center(
          child: Text(
            "Create an account ✏️",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),

        // Subtitle
        const Center(
          child: Text(
            "Please enter your username, email address and password. "
            "If you forget it, then you have to do forgot password.",
            style: TextStyle(fontSize: 15, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),

        // Username
        _buildLabel("Username"),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.check, color: Colors.green),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B61FF)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B61FF), width: 2),
            ),
          ),
        ),

        // Email
        _buildLabel("Email"),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B61FF)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B61FF), width: 2),
            ),
          ),
        ),

        // Password
        _buildLabel("Password"),
        TextField(
          controller: passwordController,
          obscureText: !passwordVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.purple,
              ),
              onPressed: () =>
                  setState(() => passwordVisible = !passwordVisible),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B61FF)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7B61FF), width: 2),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Remember me
        Row(
          children: [
            Checkbox(
              activeColor: const Color(0xFF7B61FF),
              value: rememberMe,
              onChanged: (value) =>
                  setState(() => rememberMe = value ?? false),
            ),
            const Text("Remember me"),
          ],
        ),

        const SizedBox(height: 10),

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
          icon: "assets/icons/Flutter_logo.png",
          text: "Continue with Google",
        ),

        const SizedBox(height: 30),

        // Sign up button
        // SizedBox(
        //   width: double.infinity,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: const Color(0xFF7B61FF),
        //       padding: const EdgeInsets.symmetric(vertical: 15),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(30),
        //       ),
        //     ),
        //     onPressed: () {
        //       showDialog(
        //         context: context,
        //         barrierDismissible: false,
        //         builder: (context) => const SuccessDialog(),
        //       );
        //     },
        //     child: const Text(
        //       "Sign up",
        //       style: TextStyle(fontSize: 16, color: Colors.white),
        //     ),
        //   ),
        // ),
        AnimatedButton(
              width: 300,
              height: 60,
              color: const Color(0xFFFFA63D),
              borderRadius: 16,
              shadowDegree: ShadowDegree.dark,
              duration: 100,
              enabled: true,
              onPressed: () {
                Get.toNamed('/SignUpPage');
              },
              child: const Text(
                "Sign up",
                 style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
        const SizedBox(height: 20),
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
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }

  Widget _buildSocialButton({required String icon, required String text}) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade300),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      icon: Image.asset(icon, height: 24, width: 24),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
      onPressed: () {},
    );
  }
}
