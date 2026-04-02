import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {

  bool newOrders = true;
  bool promotions = true;
  bool systemAlerts = true;
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Notification Settings",
      child: SingleChildScrollView(
        child: Column(
          children: [

            /// Orders Notifications
            _sectionTitle("Orders"),
            _buildSwitch(
              "New Orders",
              newOrders,
                  (v) => setState(() => newOrders = v),
            ),

            const SizedBox(height: 15),

            /// Marketing Notifications
            _sectionTitle("Marketing"),
            _buildSwitch(
              "Promotions",
              promotions,
                  (v) => setState(() => promotions = v),
            ),

            const SizedBox(height: 15),

            /// System Notifications
            _sectionTitle("System"),
            _buildSwitch(
              "System Alerts",
              systemAlerts,
                  (v) => setState(() => systemAlerts = v),
            ),

            const SizedBox(height: 15),

            /// Sound Toggle
            _sectionTitle("Sound"),
            _buildSwitch(
              "Notification Sound",
              soundEnabled,
                  (v) => setState(() => soundEnabled = v),
            ),
          ],
        ),
      ),
    );
  }

  /* ===========================
     SECTION TITLE
  ============================ */

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /* ===========================
     SWITCH TILE
  ============================ */

  Widget _buildSwitch(
      String title,
      bool value,
      Function(bool) onChanged,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.fieldBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        value: value,
        activeColor: AppColors.primaryBlue,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
