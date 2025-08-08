import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/views/BottomNavigationBar/navigationbar.dart';
import 'package:quizzo/widgets/animated_button.dart';

class TypeAccountScreen extends StatefulWidget {
  const TypeAccountScreen({super.key});

  @override
  State<TypeAccountScreen> createState() => _TypeAccountScreenState();
}

class _TypeAccountScreenState extends State<TypeAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button & Progress bar
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.toNamed('/onboarding');
                    },
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.25, // 25% progress
                        minHeight: 8,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(
                           Color(0xFFFFA63D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Title
              Center(
                child: const Text(
                  "What type of account do\nyou like to create? 🧑",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Center(
                child: Text(
                  "You can skip it if you're not sure.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Account Type Buttons
              _buildAccountOption(
                icon: Icons.person,
                title: "Personal",
                color: Colors.blue,
                onTap: () { Get.toNamed('/CreateAccountPage');},
              ),
              _buildAccountOption(
                icon: Icons.person_outline,
                title: "Teacher",
                color: Colors.orange,
                onTap: () { Get.toNamed('/CreateAccountPage');},
              ),
              _buildAccountOption(
                icon: Icons.people,
                title: "Student",
                color: Colors.green,
                onTap: () { Get.toNamed('/CreateAccountPage');},
              ),

              const Spacer(),

              // Skip Button
              Center(
                child: AnimatedButton(
                  width: 300,
                  height: 60,
                  color: Color(0xFFFFA63D),
                  borderRadius: 16,
                  shadowDegree: ShadowDegree.dark,
                  duration: 100,
                  enabled: true,
                  onPressed: () {
                   Get.off(
                      const BottomNavigationBarScreen(),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w700, fontFamily: 'Roboto',),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}