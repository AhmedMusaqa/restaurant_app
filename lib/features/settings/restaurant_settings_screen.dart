import 'package:flutter/material.dart';
import 'settings_base_layout.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

class RestaurantSettingsScreen extends StatefulWidget {
  const RestaurantSettingsScreen({super.key});

  @override
  State<RestaurantSettingsScreen> createState() =>
      _RestaurantSettingsScreenState();
}

class _RestaurantSettingsScreenState
    extends State<RestaurantSettingsScreen> {

  bool isOpen = true;
  List<String> selectedDays = [];
  String preparationTime = "15 min";

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Restaurant Settings",
      child: SingleChildScrollView(
        child: Column(
          children: [

            /// Open / Close Switch
            SwitchListTile(
              value: isOpen,
              activeColor: AppColors.primaryBlue,
              title: const Text("Restaurant Open",
                  style: TextStyle(color: Colors.white)),
              onChanged: (v) => setState(() => isOpen = v),
            ),

            const SizedBox(height: 15),

            /// Opening Hours
            CustomSettingsTile(
              title: "Opening Hours",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OpeningHoursScreen(),
                  ),
                );
              },
            ),

            /// Working Days Multi Select
            _workingDaysSelector(),

            /// Default Preparation Time Dropdown
            _preparationDropdown(),

            /// Minimum Order
            _numberField("Minimum Order"),

            /// Delivery Fee
            _numberField("Delivery Fee"),

            /// Delivery Radius (Navigate to Map)
            CustomSettingsTile(
              title: "Delivery Radius",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DeliveryAreaScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /* ==============================
     WORKING DAYS MULTI SELECT
  ============================== */

  Widget _workingDaysSelector() {
    final days = [
      "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Working Days",
              style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: days.map((day) {
            final isSelected = selectedDays.contains(day);
            return ChoiceChip(
              label: Text(day),
              selected: isSelected,
              selectedColor: AppColors.primaryBlue,
              backgroundColor: AppColors.fieldBackground,
              labelStyle:
              const TextStyle(color: Colors.white),
              onSelected: (v) {
                setState(() {
                  if (isSelected) {
                    selectedDays.remove(day);
                  } else {
                    selectedDays.add(day);
                  }
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  /* ==============================
     PREPARATION TIME DROPDOWN
  ============================== */

  Widget _preparationDropdown() {
    final options = ["10 min", "15 min", "20 min", "30 min"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Default Preparation Time",
              style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: preparationTime,
          dropdownColor: AppColors.backgroundTop,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.fieldBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          items: options.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(e),
            );
          }).toList(),
          onChanged: (v) {
            setState(() => preparationTime = v!);
          },
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  /* ==============================
     NUMBER FIELD
  ============================== */

  Widget _numberField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        keyboardType: TextInputType.number,
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
}

/* ============================================
   OPENING HOURS SCREEN
============================================= */

class OpeningHoursScreen extends StatelessWidget {
  const OpeningHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Opening Hours",
      child: Column(
        children: [
          _timeTile("Opening Time"),
          const SizedBox(height: 15),
          _timeTile("Closing Time"),
        ],
      ),
    );
  }

  Widget _timeTile(String title) {
    return CustomSettingsTile(title: title);
  }
}

/* ============================================
   DELIVERY AREA SCREEN
============================================= */

class DeliveryAreaScreen extends StatefulWidget {
  const DeliveryAreaScreen({super.key});

  @override
  State<DeliveryAreaScreen> createState() =>
      _DeliveryAreaScreenState();
}

class _DeliveryAreaScreenState extends State<DeliveryAreaScreen> {

  double radius = 5;

  @override
  Widget build(BuildContext context) {
    return SettingsBaseLayout(
      title: "Delivery Area",
      child: Column(
        children: [

          /// Placeholder Map View
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.fieldBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Map View",
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Radius: ${radius.toStringAsFixed(0)} KM",
            style: const TextStyle(color: Colors.white),
          ),

          Slider(
            value: radius,
            min: 1,
            max: 20,
            activeColor: AppColors.primaryBlue,
            onChanged: (v) {
              setState(() => radius = v);
            },
          ),
        ],
      ),
    );
  }
}
