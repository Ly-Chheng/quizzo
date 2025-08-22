import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';
import 'package:quizzo/controllers/auth/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = AuthController();

  String? _email;
  String? _password;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _controller.login(_email!, _password!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Email"),
            validator: Validators.validateEmail,
            onSaved: (value) => _email = value,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Password"),
            obscureText: true,
            validator: Validators.validatePassword,
            onSaved: (value) => _password = value,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submit,
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
