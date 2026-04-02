import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/features/support/help_center_screen.dart';
import 'package:restaurant_app/features/support/contact_support_screen.dart';
import 'package:restaurant_app/core/routes/app_routes.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Support",
      child: Column(
        children: [
          _customTile(
            context,
            title: "Help Center",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.helpCenter);
            },
          ),
          _customTile(
            context,
            title: "Contact Support",
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.contactSupport);
            },
          ),
        ],
      ),
    );
  }

  Widget _customTile(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return Card(
      color: AppColors.fieldBackground,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 18),
        onTap: onTap,
      ),
    );
  }
}
