import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({
    super.key,
  });

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "CreateScreen".tr,
        ),
      ),
    );
  }
}
