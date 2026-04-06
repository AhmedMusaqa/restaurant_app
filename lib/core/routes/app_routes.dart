import 'package:flutter/material.dart';
import 'package:restaurant_app/features/auth/ui/login_screen.dart';
import 'package:restaurant_app/features/auth/ui/signup_screen.dart';
import 'package:restaurant_app/features/auth/ui/forgot_password_screen.dart';
import 'package:restaurant_app/features/auth/ui/verification_screen.dart';
import 'package:restaurant_app/features/home/ui/home_page.dart';
import 'package:restaurant_app/features/settings/about_screen.dart';
import 'package:restaurant_app/features/settings/account_settings_screen.dart';
import 'package:restaurant_app/features/settings/earnings_screen.dart';
import 'package:restaurant_app/features/settings/language_screen.dart';
import 'package:restaurant_app/features/settings/notification_settings_screen.dart';
import 'package:restaurant_app/features/settings/offers_screen.dart';
import 'package:restaurant_app/features/settings/privacy_terms_screen.dart';
import 'package:restaurant_app/features/settings/restaurant_settings_screen.dart';
import 'package:restaurant_app/features/settings/security_screen.dart';
import 'package:restaurant_app/features/settings/support_screen.dart';
import 'package:restaurant_app/features/support/contact_support_screen.dart';
import 'package:restaurant_app/features/support/help_center_screen.dart';
import 'package:restaurant_app/features/settings/settings_screen.dart';

class AppRoutes {
  // Auth & Home
  static const String login = '/';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String verification = '/verification';
  static const String home = '/home';

  // Account Settings
  static const String accountOverview = '/account-overview';
  static const String editAccountInfo = '/edit-account-info';
  static const String changePassword = '/change-password';
  static const String deleteAccount = '/delete-account';

  // Restaurant Settings
  static const String restaurantMainSettings = '/restaurant-main-settings';
  static const String openingHours = '/opening-hours';
  static const String deliveryArea = '/delivery-area';

  // Notification Settings
  static const String notificationSettings = '/notification-settings';

  // Language Settings
  static const String languageSettings = '/language-settings';

  // Offers & Discounts
  static const String offersSettings = '/offers-settings';

  // Security & Privacy
  static const String securityScreen = '/security-screen';
  static const String privacyScreen = '/privacy-screen';

  // Support
  static const String helpCenter = '/help-center';
  static const String contactSupport = '/contact-support';

  // About App
  static const String aboutScreen = '/about';

  // Earnings
  static const String earningsOverview = '/earnings-overview';

  static Map<String, WidgetBuilder> get routes => {
    // Auth
    login: (context) => const LoginScreen(),
   // signup: (context) => const SignupScreen(),
    forgotPassword: (context) => const ForgotPasswordScreen(),
    verification: (context) => const VerificationScreen(),
    home: (context) => const HomePage(),

    // Account Settings
    accountOverview: (context) => const AccountSettingsScreen(),
    editAccountInfo: (context) => const AccountSettingsScreen(),
    changePassword: (context) => const ChangePasswordScreen(),
    deleteAccount: (context) => const AccountSettingsScreen(),

    // Restaurant Settings
    restaurantMainSettings: (context) => const RestaurantSettingsScreen(),
    openingHours: (context) => const OpeningHoursScreen(),
    deliveryArea: (context) => const DeliveryAreaScreen(),

    // Notification Settings
    notificationSettings: (context) => const NotificationSettingsScreen(),

    // Language Settings
    languageSettings: (context) => const LanguageScreen(),

    // Offers & Discounts
    offersSettings: (context) => const OffersScreen(),

    // Security & Privacy
    securityScreen: (context) => const SecurityScreen(),
    privacyScreen: (context) => const PrivacyAndTermsScreen(),

    // Support
    helpCenter: (context) => const HelpCenterScreen(),
    contactSupport: (context) => const ContactSupportScreen(),

    // About App
    aboutScreen: (context) => const AboutScreen(),

    // Earnings
    earningsOverview: (context) => const EarningsOverviewScreen(),
  };
}
