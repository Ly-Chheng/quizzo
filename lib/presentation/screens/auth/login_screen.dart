import 'package:flutter/material.dart';
import '../../../core/constants/strings.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.login)),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}
