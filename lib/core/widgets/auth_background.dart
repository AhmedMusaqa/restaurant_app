import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        // The error was here: LinearRoute should be LinearGradient
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundTop,
            AppColors.backgroundBottom,
          ],
        ),
      ),
      // SafeArea ensures content doesn't overlap with the notch or status bar
      child: SafeArea(child: child),
    );
  }
}