import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/core/utils/app_fonts.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
              SizedBox(
                height: (Get.context?.isPhone ?? true) ? 30 : 60,
              ),

              // Title
              Center(
                child: Text(
                  "What type of account do\nyou like to create? 🧑",
                  style: Style.headerTextStyleBold22_24(context),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Center(
                child: Text(
                  "You can skip it if you're not sure.",
                  style: Style.bodyText14_16(context),
                ),
              ),
              SizedBox(
                height: (Get.context?.isPhone ?? true) ? 30 : 50,
              ),

              // Account Type Buttons
              _buildAccountOption(
                icon: Icons.person,
                title: "Personal",
                color: Colors.blue,
                onTap: () {
                  Get.toNamed('/SignUpPage');
                },
              ),
              _buildAccountOption(
                icon: Icons.person_outline,
                title: "Teacher",
                color: Colors.orange,
                onTap: () {
                  Get.toNamed('/SignUpPage');
                },
              ),
              _buildAccountOption(
                icon: Icons.people,
                title: "Student",
                color: Colors.green,
                onTap: () {
                  Get.toNamed('/SignUpPage');
                },
              ),

              const Spacer(),
              Center(
                child: AnimatedButton(
                  width: double.infinity,
                  height: (Get.context?.isPhone ?? true) ? 50 : 60,
                  color: Color(0xFFFFA63D),
                  borderRadius: 25,
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
                    style: TextStyle(
                     fontFamily: AppFonts().fontExBold
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (Get.context?.isPhone ?? true) ? 20 : 30,
              ),
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
        margin: EdgeInsets.only(
          bottom: (Get.context?.isPhone ?? true) ? 15 : 20,
        ),
     
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              width: (Get.context?.isPhone ?? true) ? 15 : 30,
            ),
            Text(
              title,
              style: Style.subHeaderTextStyleBold20_22(context),
            )
          ],
        ),
      ),
    );
  }
}
