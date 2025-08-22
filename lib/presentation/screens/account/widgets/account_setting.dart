import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/controllers/account/account_controller.dart';
import 'package:quizzo/core/theme/app_theme.dart';

class AccountSetting extends GetView<AccountController> {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppTheme().isSavedDarkMode().obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          alignment: Alignment.topLeft,
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Premium Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF6B45E8),
                      Color(0xFF8B64F8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    // Stars
                    _buildStar(top: 40, left: 240, size: 30),
                    _buildStar(top: 60, left: 160, size: 25),
                    _buildStar(bottom: -5, right: -5, size: 47),
                    _buildStar(bottom: 20, right: 30, size: 40),
                    _buildStar(bottom: 50, right: 100, size: 25),
                    // Content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Play quizzes without\nads and restrictions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6B45E8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: const Text(
                            'GO PREMIUM',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Settings Items
              _buildSettingsItem(
                icon: Icons.person_outline,
                iconColor: Colors.orange.shade200,
                title: 'Personal Info',
              ),
              const SizedBox(height: 16),
              _buildSettingsItem(
                icon: Icons.notifications_none,
                iconColor: Colors.pink.shade200,
                title: 'Notification',
              ),
              const SizedBox(height: 16),
              _buildSettingsItem(
                icon: Icons.volume_up_outlined,
                iconColor: Colors.purple.shade200,
                title: 'Music & Effects',
              ),
              const SizedBox(height: 16),
              _buildSettingsItem(
                icon: Icons.security_outlined,
                iconColor: Colors.green.shade200,
                title: 'Security',
              ),
              const SizedBox(height: 16),
              _buildDarkModeItem(isDark),
              const SizedBox(height: 16),
              _buildSettingsItem(
                icon: Icons.help_outline,
                iconColor: Colors.orange.shade400,
                title: 'Help Center',
              ),
              const SizedBox(height: 16),
              _buildSettingsItem(
                icon: Icons.info_outline,
                iconColor: Colors.deepPurple.shade200,
                title: 'About Quizzo',
              ),
              const SizedBox(height: 16),

              // Logout Button
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStar({double? top, double? bottom, double? left, double? right, required double size}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Icon(
        Icons.star,
        color: Colors.yellow.shade400,
        size: size,
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    Widget? trailing,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.grey.shade100,
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }

  Widget _buildDarkModeItem(isDark) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.grey.shade100,
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.dark_mode_outlined, color: Colors.white),
      ),
      title: const Text(
        'Dark Mode',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: Obx(
        () {
          return Switch.adaptive(
            onChanged: (darkValue) {
              AppTheme().changeTheme(darkValue);
            },
            value: isDark.value,
          );
        },
      ),
    );
  }

  Widget _buildLogoutButton() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.grey.shade100,
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.logout, color: Colors.white),
      ),
      title: const Text(
        'Logout',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red),
      onTap: () {},
    );
  }
}
