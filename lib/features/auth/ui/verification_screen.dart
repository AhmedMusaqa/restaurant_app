import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/routes/app_routes.dart';
import 'package:restaurant_app/core/widgets/auth_background.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              const Text("Verification", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text("We have sent a code to your email", style: TextStyle(color: AppColors.textGray)),
              const Text("example@gmail.com", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) => _otpBox()),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.accentPurple]),
                  ),
                  child: const Center(child: Text("VERIFY", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: AppColors.fieldBackground, borderRadius: BorderRadius.circular(12)),
      child: const Center(child: Text("0", style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }
}