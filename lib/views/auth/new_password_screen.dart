
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';
import 'package:quizzo/widgets/custom_auth.dart';
import 'package:quizzo/widgets/custom_dialog.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool rememberMe = true;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    passwordController.removeListener(_validateForm);
    confirmPasswordController.removeListener(_validateForm);
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

 void _validateForm() {
  final password = passwordController.text;
  final confirm = confirmPasswordController.text;

  final isValid = password.isNotEmpty && confirm.isNotEmpty; // no match check here

  if (isValid != _isFormValid) {
    setState(() {
      _isFormValid = isValid;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final isPhone = (Get.context?.isPhone ?? true);

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
                        Text(
                          "Create new password ",
                          style: TextStyle(
                            fontSize: isPhone ? 22 : 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: isPhone ? 8 : 10),
                        Text(
                          "Save the new password in a safe place. "
                          "If you forget it, then you have to do forgot password again.",
                          style: TextStyle(
                            fontSize: isPhone ? 15 : 18,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: isPhone ? 30 : 60),
                       
                        CustomUnderlineInput(
                          controller: passwordController,
                          labelText: "Create a new password",
                          isRequired: true,
                          isPassword: true,
                          underlineColor: Color(0xFFFFA63D),
                        ),
                        const SizedBox(height: 20),
                   
                        CustomUnderlineInput(
                          controller: confirmPasswordController,
                          labelText: "Confirm a new password",
                          isPassword: true,
                          isRequired: true,
                          underlineColor: Color(0xFFFFA63D),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFFFA63D),
                              value: rememberMe,
                              onChanged: (value) =>
                                  setState(() => rememberMe = value ?? false),
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                fontSize: isPhone ? 14 : 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: isPhone ? 30 : 40),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                child: AnimatedButton(
                  width: double.infinity,
                  height: isPhone ? 50 : 60,
                  color: _isFormValid ? const Color(0xFFFFA63D) : Colors.grey.shade400,
                  borderRadius: 16,
                  shadowDegree: ShadowDegree.dark,
                  duration: 100,
                  enabled: _isFormValid,
                  onPressed: () {
                    if (!_isFormValid) return;
                    
                  // Show success dialog
                    showDialog(
                      context: context,
                      builder: (context) => SuccessDialog(
                        icon: Icons.check_box,
                        title: 'Welcome Back!',
                        subtitle: 'You have successfully reset and created a new password.',
                        showLoader: false,
                      ),
                    );
                      Get.offAllNamed('/BottomNavigationBar');
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: isPhone ? 16 : 18,
                      color: _isFormValid ? const Color(0xFFFFFFFF) : Colors.grey[400],
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
