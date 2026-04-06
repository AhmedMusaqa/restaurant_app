import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart'; // تأكد من استيراد ملف الرواتات
import 'package:restaurant_app/features/auth/data/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  var isLoading = false.obs;

  void login(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await _authService.login(email, password);
      
      if (response != null) {
        // نستخدم المسمى الموجود في ملف AppRoutes الخاص بك
        // Get.offAllNamed يحذف شاشة اللوجن من الذاكرة وينتقل للهوم
        Get.offAllNamed(AppRoutes.home); 
      } else {
        Get.snackbar("خطأ", "بيانات الدخول غير صحيحة أو لست صاحب مطعم");
      }
    } finally {
      isLoading.value = false;
    }
  }
}