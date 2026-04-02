import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool twoFactor = false;

  // بيانات الجلسات النشطة Dummy Data
  List<String> activeSessions = [
    "Web - Chrome on Windows",
    "Mobile - Android Device",
    "Tablet - iPad",
  ];

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Security",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                value: twoFactor,
                activeColor: AppColors.primaryBlue,
                title: const Text("Enable Two-Factor Authentication",
                    style: TextStyle(color: Colors.white)),
                onChanged: (v) => setState(() => twoFactor = v),
              ),
              const SizedBox(height: 20),
              const Text(
                "Active Sessions",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activeSessions.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: AppColors.fieldBackground,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(activeSessions[index],
                          style: const TextStyle(color: Colors.white)),
                      trailing: IconButton(
                        icon: const Icon(Icons.logout,
                            color: Colors.redAccent, size: 22),
                        onPressed: () {
                          setState(() {
                            activeSessions.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Session logged out")),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      activeSessions.clear();
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Logged out from all sessions")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Logout from all sessions",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
