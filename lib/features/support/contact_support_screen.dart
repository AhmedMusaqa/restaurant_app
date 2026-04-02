import 'package:flutter/material.dart';
import 'package:restaurant_app/features/settings/settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? attachedImage; // هنا يمكن إضافة صورة مرفقة لاحقًا

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Contact Support",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _subjectController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Subject",
                  hintStyle: TextStyle(color: AppColors.textGray),
                  filled: true,
                  fillColor: AppColors.fieldBackground,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _messageController,
                maxLines: 5,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Message",
                  hintStyle: TextStyle(color: AppColors.textGray),
                  filled: true,
                  fillColor: AppColors.fieldBackground,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // هنا تضيف وظيفة اختيار صورة
                    },
                    icon: const Icon(Icons.attach_file),
                    label: const Text("Attach Image"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentPurple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (attachedImage != null)
                    Text(
                      "Attached: $attachedImage",
                      style: const TextStyle(color: Colors.white70),
                    )
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // هنا تضيف وظيفة ارسال الرسالة
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Message sent!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
