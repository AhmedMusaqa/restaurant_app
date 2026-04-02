import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _baseLayout(
      context,
      "Account Overview",
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _InfoTile(label: "Restaurant Name", value: "My Restaurant"),
          const _InfoTile(label: "Email", value: "restaurant@email.com"),
          const _InfoTile(label: "Phone", value: "+967 77 000 0000"),
          const SizedBox(height: 20),

          _CustomTile(
            title: "Edit Account Info",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditAccountScreen(),
                ),
              );
            },
          ),

          _CustomTile(
            title: "Change Password",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChangePasswordScreen(),
                ),
              );
            },
          ),

          _CustomTile(
            title: "Delete Account",
            isDanger: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DeleteAccountScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/* ===============================
   EDIT ACCOUNT INFO
================================= */

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _baseLayout(
      context,
      "Edit Account Info",
      Column(
        children: [
          _customField("Restaurant Name"),
          _customField("Email"),
          _customField("Phone Number"),
          const SizedBox(height: 20),
          _primaryButton("Save"),
        ],
      ),
    );
  }
}

/* ===============================
   CHANGE PASSWORD
================================= */

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _baseLayout(
      context,
      "Change Password",
      Column(
        children: [
          _customField("Current Password", obscure: true),
          _customField("New Password", obscure: true),
          _customField("Confirm Password", obscure: true),
          const SizedBox(height: 20),
          _primaryButton("Save"),
        ],
      ),
    );
  }
}

/* ===============================
   DELETE ACCOUNT
================================= */

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _baseLayout(
      context,
      "Delete Account",
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Warning: This action cannot be undone!",
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _customField("Enter Password", obscure: true),
          const SizedBox(height: 20),
          _dangerButton("Delete Account"),
        ],
      ),
    );
  }
}

/* ===============================
   BASE LAYOUT (DO NOT MODIFY)
================================= */

Widget _baseLayout(BuildContext context, String title, Widget child) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    body: Container(
      padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.backgroundTop,
            AppColors.backgroundBottom,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(child: child),
    ),
  );
}

/* ===============================
   REUSABLE COMPONENTS
================================= */

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const _InfoTile({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fieldBackground,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _CustomTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isDanger;

  const _CustomTile({
    required this.title,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.fieldBackground,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: isDanger ? Colors.redAccent : Colors.white,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}

Widget _customField(String hint, {bool obscure = false}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: AppColors.fieldBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _primaryButton(String text) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlue,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    ),
  );
}

Widget _dangerButton(String text) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    ),
  );
}
