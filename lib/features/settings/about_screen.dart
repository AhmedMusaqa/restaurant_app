import 'package:flutter/material.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "About App",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              // App Logo
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryBlue,
                child: const Icon(Icons.restaurant_menu,
                    size: 50, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ListTile(
                title: const Text("App Version",
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text("1.0.0",
                    style: TextStyle(color: Colors.white70)),
              ),
              const Divider(color: Colors.white24),
              ListTile(
                title: const Text("Company Info",
                    style: TextStyle(color: Colors.white)),
                subtitle: const Text("Restaurant Graduation Project",
                    style: TextStyle(color: Colors.white70)),
              ),
              const Divider(color: Colors.white24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Checking for updates...")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Check for Updates",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
}
