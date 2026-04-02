import 'package:flutter/material.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> faqList = [
    "How to reset my password?",
    "How to update restaurant info?",
    "How to manage opening hours?",
    "How to enable delivery area?",
    "How to apply discounts?"
  ];
  List<String> filteredFaq = [];

  @override
  void initState() {
    super.initState();
    filteredFaq = faqList;
  }

  void _filterFaq(String query) {
    setState(() {
      filteredFaq = faqList
          .where((faq) => faq.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Help Center",
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: _filterFaq,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search FAQ...",
                hintStyle: TextStyle(color: AppColors.textGray),
                filled: true,
                fillColor: AppColors.fieldBackground,
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFaq.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.fieldBackground,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(filteredFaq[index],
                        style: const TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.white70, size: 18),
                    onTap: () {
                      // هنا يمكن إضافة وظيفة عرض التفاصيل إذا أردت
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
