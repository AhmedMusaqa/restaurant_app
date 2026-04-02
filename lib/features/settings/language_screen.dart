import 'package:flutter/material.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English";
  bool isRTL = false;

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Language",
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            RadioListTile(
              value: "English",
              groupValue: selectedLanguage,
              activeColor: AppColors.primaryBlue,
              title: const Text("English",
                  style: TextStyle(color: Colors.white)),
              onChanged: (v) => setState(() => selectedLanguage = v!),
            ),
            RadioListTile(
              value: "Arabic",
              groupValue: selectedLanguage,
              activeColor: AppColors.primaryBlue,
              title: const Text("Arabic",
                  style: TextStyle(color: Colors.white)),
              onChanged: (v) => setState(() => selectedLanguage = v!),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                "RTL / LTR",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Switch(
                value: isRTL,
                activeColor: AppColors.accentPurple,
                onChanged: (v) => setState(() => isRTL = v),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // هنا تضيف وظيفة تطبيق اللغة والاتجاه
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Language applied: $selectedLanguage, RTL: $isRTL",
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "Apply",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
