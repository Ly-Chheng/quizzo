import 'package:flutter/material.dart';

class CustomUnderlineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? suffixIcon;
  final Color underlineColor;
  final Color iconColor;

  const CustomUnderlineTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.underlineColor = const Color(0xFFFFA63D),
    this.iconColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: iconColor)
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor, width: 2),
        ),
      ),
    );
  }
}



class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final Color underlineColor;
  final Color iconColor;
  final String? hintText;

  const PasswordField({
    super.key,
    required this.controller,
    this.underlineColor = const Color(0xFFFFA63D),
    this.iconColor = const Color(0xFFFFA63D),
    this.hintText,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !passwordVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: widget.iconColor,
          ),
          onPressed: () => setState(() {
            passwordVisible = !passwordVisible;
          }),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor, width: 2),
        ),
      ),
    );
  }
}
