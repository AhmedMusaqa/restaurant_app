import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/routes/app_routes.dart';
import 'package:restaurant_app/core/widgets/app_text_field.dart';
import 'package:restaurant_app/core/widgets/auth_background.dart';
import 'package:restaurant_app/features/auth/logic/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  void _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = context.read<AuthProvider>();

      // Call mock signup service
      bool success = await authProvider.signUp(
        _nameController.text,
        _emailController.text,
        _passController.text,
      );

      if (success && mounted) {
        // As per instructions: Sign Up -> go to Verification screen
        Navigator.pushNamed(context, AppRoutes.verification);
      } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.error ?? "Signup failed"),
        ),
      );
    }

  }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
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
                const SizedBox(height: 20),
                const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Please sign up to get started", style: TextStyle(color: AppColors.textGray)),
                const SizedBox(height: 40),

                AppTextField(
                  label: "Name",
                  hint: "John doe",
                  controller: _nameController,
                  validator: (v) => v!.isEmpty ? "Name is required" : null,
                ),
                const SizedBox(height: 20),

                AppTextField(
                  label: "Email",
                  hint: "example@gmail.com",
                  controller: _emailController,
                  validator: (v) => v!.contains('@') ? null : "Enter a valid email",
                ),
                const SizedBox(height: 20),

                AppTextField(
                  label: "Password",
                  hint: "••••••••••••",
                  isPassword: true,
                  controller: _passController,
                  suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white54),
                  validator: (v) => v!.length < 6 ? "Password must be 6+ chars" : null,
                ),
                const SizedBox(height: 20),

                AppTextField(
                  label: "Re-type Password",
                  hint: "••••••••••••",
                  isPassword: true,
                  controller: _confirmPassController,
                  suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white54),
                  validator: (v) => v != _passController.text ? "Passwords do not match" : null,
                ),

                const SizedBox(height: 40),

                GestureDetector(
                  onTap: authProvider.isLoading ? null : _handleSignUp,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.accentPurple]),
                    ),
                    child: Center(
                      child: authProvider.isLoading
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : const Text("SIGN UP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}