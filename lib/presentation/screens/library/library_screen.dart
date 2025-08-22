import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({
    super.key,
  });

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "LibraryScreen".tr,
        ),
      ),
    );
  }
}
