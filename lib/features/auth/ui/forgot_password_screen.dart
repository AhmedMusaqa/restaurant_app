import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/routes/app_routes.dart';
import 'package:restaurant_app/core/widgets/app_text_field.dart';
import 'package:restaurant_app/core/widgets/auth_background.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const SizedBox(height: 40),
                const Text("Forgot Password", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
                  "Please sign in to your existing account", // As per Figma text
                  style: TextStyle(color: AppColors.textGray),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),

                AppTextField(
                  label: "Email",
                  hint: "example@gmail.com",
                  controller: _emailController,
                  validator: (v) => v!.isEmpty ? "Email is required" : null,
                ),

                const SizedBox(height: 40),

                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // As per instructions: Forgot Password -> go to Verification screen
                      Navigator.pushNamed(context, AppRoutes.verification);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.accentPurple]),
                    ),
                    child: const Center(
                      child: Text("SEND CODE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}