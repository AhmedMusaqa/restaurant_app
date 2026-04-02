import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/features/settings/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75, // Responsive width
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4A148C), // Deep Purple
              Color(0xFF2E0D52), // Darker Purple
              Color(0xFF120321), // Near Black
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(context),

            // Menu Scrollable Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionLabel("MENU"),
                    _drawerItem(Icons.person_outline, "Profile", isSelected: true),
                    _drawerItem(Icons.history, "History"),
                    _drawerItem(Icons.account_balance_wallet_outlined, "Wallet"),
                    _drawerItem(Icons.notifications_none, "Notifications"),
                    _drawerItem(Icons.favorite_border, "Favourite"),
                    _drawerItem(Icons.group_add_outlined, "Invite Friends"),
                    _drawerItem(Icons.search, "Search"),

                    const SizedBox(height: 30),

                    _sectionLabel("SETTINGS AND SUPPORT"),
                    _drawerItem(
                      Icons.settings_outlined,
                      "Settings and Privacy",
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),

                    _drawerItem(Icons.help_outline, "Help center"),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white24),
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
          const CircleAvatar(
            radius: 45,
            backgroundColor: AppColors.primaryBlue,
            child: CircleAvatar(
              radius: 42,
              backgroundImage: NetworkImage('https://i.imgur.com/8Km9tLL.png'), // Placeholder image
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Helene Chung",
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white54, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
    );
  }

  Widget _drawerItem(
      IconData icon,
      String title, {
        bool isSelected = false,
        VoidCallback? onTap,
      }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: isSelected
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryBlue.withOpacity(0.4),
            Colors.transparent,
          ],
        ),
        border: const Border(
            left: BorderSide(color: AppColors.primaryBlue, width: 3)),
      )
          : null,
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: 22),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        onTap: onTap,
      ),
    );
  }
}