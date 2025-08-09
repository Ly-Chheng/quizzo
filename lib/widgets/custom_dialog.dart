import 'package:flutter/material.dart';
import 'package:quizzo/widgets/loading_screen.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile icon with gradient background
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFFA63D), Color.fromARGB(255, 238, 165, 81)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 24),

            // Title
            const Text(
              'Successful!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFA63D),
              ),
            ),
            const SizedBox(height: 8),

            // Subtitle
            const Text(
              'Please wait a moment, we are preparing for you...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            // Loading dots
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFA63D)),
            //   strokeWidth: 5,
            // ),
            RotatingDotsLoader()
          ],
        ),
      ),
    );
  }
}
