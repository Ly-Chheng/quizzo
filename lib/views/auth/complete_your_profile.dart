import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/widgets/animated_button.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController fullNameController =
      TextEditingController(text: "Chamroeun");
  final TextEditingController dobController =
      TextEditingController(text: "12/27/1995");
  final TextEditingController phoneController =
      TextEditingController(text: "900-555-0399");

  String country = "Cambodia";
  String age = "25";

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
            value: 0.25, // 25% progress
            minHeight: 8,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color(0xFFFFA63D),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable form content
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Center(
                      child: Text(
                        "Create an account ✏️",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    const Center(
                      child: Text(
                        "Please complete your profile.\nDon't worry, your data will remain private and only you can see it.",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Full Name
                    _buildLabel("Full Name"),
                    _buildTextField(controller: fullNameController),

                    // Date of Birth
                    _buildLabel("Date of Birth"),
                    _buildTextField(
                      controller: dobController,
                      suffixIcon: Icons.calendar_month_outlined,
                      onTap: () {
                        // TODO: Show date picker
                      },
                    ),

                    // Phone Number
                    _buildLabel("Phone Number"),
                    _buildTextField(controller: phoneController),

                    // Country
                    _buildLabel("Country"),
                    _buildDropdown(
                      value: country,
                      items: const ["United States", "Cambodia", "Japan"],
                      onChanged: (val) => setState(() => country = val!),
                    ),

                    // Age
                    _buildLabel("Age"),
                    _buildDropdown(
                      value: age,
                      items: const ["18", "20", "25", "30"],
                      onChanged: (val) => setState(() => age = val!),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // Fixed Continue button
            AnimatedButton(
              width: 300,
              height: 60,
              color: const Color(0xFFFFA63D),
              borderRadius: 16,
              shadowDegree: ShadowDegree.dark,
              duration: 100,
              enabled: true,
              onPressed: () {
                Get.offAllNamed('/SignUpPage');
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    IconData? suffixIcon,
    VoidCallback? onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: onTap != null,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.deepPurple) : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items:
          items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2),
        ),
      ),
    );
  }
}
