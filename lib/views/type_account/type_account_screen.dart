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
      // AppBar with back button and progress bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.toNamed('/onboarding');
          },
        ),
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
           value: 0.5,
            minHeight: (Get.context?.isPhone ?? true) ? 10 : 12,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFFFFA63D),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: (Get.context?.isPhone ?? true) ? 30 : 60,),

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
                    fontSize:  (Get.context?.isPhone ?? true) ? 16 : 18,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
               SizedBox(height: (Get.context?.isPhone ?? true) ? 30 : 50,),

              // Account Type Buttons
              _buildAccountOption(
                icon: Icons.person,
                title: "Personal",
                color: Colors.blue,
                onTap: () { Get.toNamed('/SignUpPage');},
              ),
              _buildAccountOption(
                icon: Icons.person_outline,
                title: "Teacher",
                color: Colors.orange,
                onTap: () { Get.toNamed('/SignUpPage');},
              ),
              _buildAccountOption(
                icon: Icons.people,
                title: "Student",
                color: Colors.green,
                onTap: () { Get.toNamed('/SignUpPage');},
              ),

              const Spacer(),

              // Skip Button
              Center(
                child: AnimatedButton(
                 width: double.infinity,
                  height: (Get.context?.isPhone ?? true) ? 50 : 60,
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
                    style: TextStyle(color: Colors.white, fontSize: (Get.context?.isPhone ?? true) ? 16 : 18,fontWeight: FontWeight.w700, fontFamily: 'Roboto',),
                  ),
                ),
              ),
                SizedBox(height: (Get.context?.isPhone ?? true) ? 20 : 30,),
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
        margin:   EdgeInsets.only(bottom: (Get.context?.isPhone ?? true) ? 15 : 20,),
        padding:   EdgeInsets.all((Get.context?.isPhone ?? true) ? 15 : 30,),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white,),
            ),
            SizedBox(width: (Get.context?.isPhone ?? true) ? 15 : 30,),
            Text(
              title,
              style:  TextStyle(
                fontSize: (Get.context?.isPhone ?? true) ? 18 : 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}