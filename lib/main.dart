// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:provider/provider.dart';
// import 'core/routes/app_routes.dart';
// import 'core/constants/app_colors.dart';
// import 'features/auth/logic/auth_provider.dart';
//
// void main() async {
//   // Ensure Flutter bindings are initialized
//   await GetStorage.init();
//   final box = GetStorage();
//
//   // إذا كان هناك توكن مخزن، اذهب للهوم مباشرة، وإلا اذهب للوجن
//   String initialRoute = box.hasData('token') ? AppRoutes.home : AppRoutes.login;
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   runApp(
//     // Wrapping the app with MultiProvider to manage state globally
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthProvider()),
//         // You can add more providers here as the project grows (e.g., MenuProvider, OrderProvider)
//       ],
//       child: const RestaurantOwnerApp(),
//     ),
//   );
// }
//
// class RestaurantOwnerApp extends StatelessWidget {
//   const RestaurantOwnerApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Restaurant Owner App',
//       debugShowCheckedModeBanner: false,
//
//       // Theme Configuration
//       theme: ThemeData(
//         useMaterial3: true,
//         brightness: Brightness.dark, // Since your Figma is dark themed
//         primaryColor: AppColors.primaryBlue,
//         scaffoldBackgroundColor: AppColors.backgroundBottom,
//
//         // Customizing the default text theme to white for the dark background
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white),
//         ),
//
//         // Global styling for ElevatedButtons
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: AppColors.primaryBlue,
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             textStyle: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//
//       // Routing Configuration
//       initialRoute: AppRoutes.login, // The app starts at the Login Screen
//       routes: AppRoutes.routes,      // Uses the Map we defined in core/routes/app_routes.dart
//
//
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // استيراد GetX
import 'package:get_storage/get_storage.dart';
import 'core/routes/app_routes.dart';
import 'core/constants/app_colors.dart';

void main() async {
  // 1. التأكد من تهيئة الإضافات قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();

  // 2. تهيئة مخزن البيانات المحلي
  await GetStorage.init();
  final box = GetStorage();

  // 3. تحديد شاشة البداية (إذا كان مسجل دخول يذهب للهوم مباشرة)
  String initialRoute = box.hasData('token') ? AppRoutes.home : AppRoutes.login;

  runApp(RestaurantOwnerApp(startRoute: initialRoute));
}

class RestaurantOwnerApp extends StatelessWidget {
  final String startRoute;
  const RestaurantOwnerApp({super.key, required this.startRoute});

  @override
  Widget build(BuildContext context) {
    // استخدمنا GetMaterialApp بدلاً من MaterialApp لتفعيل ميزات GetX
    return GetMaterialApp(
      title: 'Restaurant Owner App',
      debugShowCheckedModeBanner: false,

      // إعدادات الثيم (Theme)
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.backgroundBottom,

        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      // إعدادات الرواتات
      initialRoute: startRoute, // يستخدم المسار الذي حددناه في دالة main
      routes: AppRoutes.routes,
    );
  }
}