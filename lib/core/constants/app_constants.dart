// lib/core/utils/app_constants.dart

class AppConstants {
  // هنا تضع رابط Cloudflared الذي يظهر لك في الترمينال
  static const String baseUrl = " https://patent-old-thompson-serve.trycloudflare.com/api";
  
  // نقاط النهاية (Endpoints)
  static const String loginEndpoint = "/auth/login";
  
  // يمكنك إضافة روابط أخرى لاحقاً هنا
  static const String ordersEndpoint = "/owner/orders";
}