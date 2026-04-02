import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  bool enableAutoOffers = false;
  final TextEditingController discountController = TextEditingController();
  String? selectedDuration;

  final List<String> durations = [
    "1 Day",
    "3 Days",
    "1 Week",
    "2 Weeks",
    "1 Month"
  ];

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Offers & Discounts",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            children: [
              SwitchListTile(
                value: enableAutoOffers,
                activeColor: AppColors.primaryBlue,
                title: const Text("Enable Auto Offers",
                    style: TextStyle(color: Colors.white)),
                onChanged: (v) => setState(() => enableAutoOffers = v),
              ),
              if (enableAutoOffers) ...[
                const SizedBox(height: 12),
                TextField(
                  controller: discountController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Default Discount Percentage",
                    hintStyle: TextStyle(color: AppColors.textGray),
                    filled: true,
                    fillColor: AppColors.fieldBackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: selectedDuration,
                  items: durations
                      .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e,
                          style: const TextStyle(color: Colors.white))))
                      .toList(),
                  dropdownColor: AppColors.backgroundBottom,
                  decoration: InputDecoration(
                    hintText: "Offers Duration",
                    hintStyle: TextStyle(color: AppColors.textGray),
                    filled: true,
                    fillColor: AppColors.fieldBackground,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (v) => setState(() => selectedDuration = v),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // وظيفة حفظ الإعدادات
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Settings saved: ${discountController.text}% for $selectedDuration",
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
