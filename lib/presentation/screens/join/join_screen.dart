import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({
    super.key,
  });

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "JoinScreen".tr,
        ),
      ),
    );
  }
}
