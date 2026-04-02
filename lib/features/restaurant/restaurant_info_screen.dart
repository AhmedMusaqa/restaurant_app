import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class RestaurantInfoScreen extends StatelessWidget {
  const RestaurantInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Restaurant Info",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: Column(
          children: [

            /// 🔹 Location Section
            _locationSection(context),

          ],
        ),
      ),
    );
  }

  /* ============================
     LOCATION SECTION
  ============================ */

  Widget _locationSection(BuildContext context) {
    String address = "Sana'a, Yemen"; // لاحقًا من DB

    return Card(
      color: AppColors.fieldBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}