import 'package:flutter/material.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class EarningsOverviewScreen extends StatelessWidget {
  const EarningsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Earnings & Reports",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            _infoCard("Total Revenue", "\$12,450"),
            _infoCard("Total Commission Deducted", "\$1,250"),
            _infoCard("Net Profit", "\$11,200"),
            _infoCard("Today's Earnings", "\$450"),
            _infoCard("This Week's Earnings", "\$2,800"),
            _infoCard("This Month's Earnings", "\$4,200"),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Card(
      color: AppColors.fieldBackground,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }
}
