import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class SettingsBaseLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingsBaseLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundTop,
              AppColors.backgroundBottom,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      ),
    );
  }
}

class CustomSettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const CustomSettingsTile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fieldBackground,
      margin: const EdgeInsets.only(bottom: 15),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title:
        Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: Colors.white54, size: 16),
        onTap: onTap,
      ),
    );
  }
}
