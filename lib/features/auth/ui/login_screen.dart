// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_app/core/constants/app_colors.dart';
// import 'package:restaurant_app/core/routes/app_routes.dart';
// import 'package:restaurant_app/core/widgets/app_text_field.dart';
// import 'package:restaurant_app/core/widgets/auth_background.dart';
// import 'package:restaurant_app/features/auth/logic/auth_provider.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = context.watch<AuthProvider>();
//
//     return Scaffold(
//       body: AuthBackground(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const SizedBox(height: 60),
//                 const Text("Log In", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 const Text("Please sign in to your existing account", style: TextStyle(color: AppColors.textGray)),
//                 const SizedBox(height: 50),
//                 AppTextField(
//                   label: "Email",
//                   hint: "example@gmail.com",
//                   controller: _emailController,
//                   validator: (v) => v!.isEmpty ? "Email required" : null,
//                 ),
//                 const SizedBox(height: 20),
//                 AppTextField(
//                   label: "Password",
//                   hint: "••••••••",
//                   isPassword: true,
//                   controller: _passController,
//                   suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.white54),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Checkbox(value: true, onChanged: (v) {}, activeColor: AppColors.primaryBlue),
//                         const Text("Remember me", style: TextStyle(color: Colors.white70, fontSize: 12)),
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () => Navigator.pushNamed(context, AppRoutes.forgotPassword),
//                       child: const Text("Forgot Password", style: TextStyle(color: AppColors.primaryBlue, fontSize: 12)),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 // Gradient Button
//                 GestureDetector(
//                   onTap: () async {
//                     if (_formKey.currentState!.validate()) {
//                       bool success = await authProvider.login(_emailController.text, _passController.text);
//                       if (success) {
//                         Navigator.pushReplacementNamed(context, AppRoutes.home);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(authProvider.error ?? "Login failed"),
//                           ),
//                         );
//                       }
//
//                     }
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.accentPurple]),
//                     ),
//                     child: Center(
//                       child: authProvider.isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don't have an account? ", style: TextStyle(color: Colors.white70)),
//                     GestureDetector(
//                       onTap: () => Navigator.pushNamed(context, AppRoutes.signup),
//                       child: const Text("SIGN UP", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 const Text("Or", style: TextStyle(color: Colors.white54)),
//                 const SizedBox(height: 20),
//                 // Social Icons Placeholder
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _socialIcon(Icons.facebook, Colors.blue),
//                     const SizedBox(width: 20),
//                     _socialIcon(Icons.apple, Colors.white),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _socialIcon(IconData icon, Color color) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.fieldBackground),
//       child: Icon(icon, color: color),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // أضفنا مكتبة GetX
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/routes/app_routes.dart';
import 'package:restaurant_app/core/widgets/app_text_field.dart';
import 'package:restaurant_app/core/widgets/auth_background.dart';
// استدعاء الكنترولر الجديد
import 'package:restaurant_app/features/auth/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // 1. ربط الكنترولر بالشاشة
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text("Log In", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Please sign in to your existing account", style: TextStyle(color: AppColors.textGray)),
                const SizedBox(height: 50),
                AppTextField(
                  label: "Email",
                  hint: "example@gmail.com",
                  controller: _emailController,
                  validator: (v) => v!.isEmpty ? "Email required" : null,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  label: "Password",
                  hint: "••••••••",
                  isPassword: true,
                  controller: _passController,
                  suffixIcon: const Icon(Icons.visibility_outlined, color: Colors.white54),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (v) {}, activeColor: AppColors.primaryBlue),
                        const Text("Remember me", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, AppRoutes.forgotPassword),
                      child: const Text("Forgot Password", style: TextStyle(color: AppColors.primaryBlue, fontSize: 12)),
                    )
                  ],
                ),
                const SizedBox(height: 30),

                // 2. تعديل الزر ليعمل مع GetX و Obx للتحديث التلقائي
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // استدعاء دالة اللوجن من الكنترولر
                      controller.login(_emailController.text, _passController.text);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: [AppColors.primaryBlue, AppColors.accentPurple]),
                    ),
                    child: Center(
                      // Obx تقوم بمراقبة قيمة isLoading وتحديث الزر فوراً
                      child: Obx(() => controller.isLoading.value
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                      )
                          : const Text("LOG IN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ", style: TextStyle(color: Colors.white70)),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, AppRoutes.signup),
                      child: const Text("SIGN UP", style: TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text("Or", style: TextStyle(color: Colors.white54)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialIcon(Icons.facebook, Colors.blue),
                    const SizedBox(width: 20),
                    _socialIcon(Icons.apple, Colors.white),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.fieldBackground),
      child: Icon(icon, color: color),
    );
  }
}