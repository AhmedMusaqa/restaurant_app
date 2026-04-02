import 'package:flutter/material.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class PrivacyAndTermsScreen extends StatelessWidget {
  const PrivacyAndTermsScreen({super.key});

  // Dummy texts
  final String privacyPolicy = '''
Privacy Policy

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada. Morbi eget metus ac nulla blandit cursus. Aliquam erat volutpat. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
''';

  final String termsAndConditions = '''
Terms and Conditions

1. Acceptance of Terms
Lorem ipsum dolor sit amet, consectetur adipiscing elit.

2. User Responsibilities
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;

3. Limitation of Liability
Cras ultricies ligula sed magna dictum porta.

4. Modifications
Curabitur aliquet quam id dui posuere blandit.
''';

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Privacy & Terms",
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Privacy Policy",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              privacyPolicy,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 30),
            const Text(
              "Terms and Conditions",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              termsAndConditions,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
