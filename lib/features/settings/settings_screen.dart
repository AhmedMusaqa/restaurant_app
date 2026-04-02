import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'account_settings_screen.dart';
import 'restaurant_settings_screen.dart';
import 'notification_settings_screen.dart';
import 'language_screen.dart';
import 'earnings_screen.dart';
import 'offers_screen.dart';
import 'security_screen.dart';
import 'support_screen.dart';
import 'about_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Settings & Privacy",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundTop,
              AppColors.backgroundBottom,
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
          children: [
            _settingsButton(context, "Account Settings",
                const AccountSettingsScreen()),
            _settingsButton(context, "Restaurant Settings",
                const RestaurantSettingsScreen()),
            _settingsButton(context, "Notification Settings",
                const NotificationSettingsScreen()),
            _settingsButton(context, "Language",
                const LanguageScreen()),
            _settingsButton(context, "Earnings & Financial Reports",
                const EarningsOverviewScreen()),
            _settingsButton(context, "Offers & Discounts Settings",
                const OffersScreen()),
            _settingsButton(context, "Security & Privacy",
                const SecurityScreen()),
            _settingsButton(context, "Support",
                const SupportScreen()),
            _settingsButton(context, "About App",
                const AboutScreen()),
          ],
        ),
      ),
    );
  }

  Widget _settingsButton(
      BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fieldBackground,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
