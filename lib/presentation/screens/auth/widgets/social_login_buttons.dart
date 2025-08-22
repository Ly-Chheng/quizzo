import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.g_mobiledata),
          label: const Text("Continue with Google"),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.facebook),
          label: const Text("Continue with Facebook"),
        ),
      ],
    );
  }
}
