import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/core/constants/app_constants.dart';
class AuthService {
  final Dio _dio = Dio();
  final box = GetStorage();

  // غيرنا void إلى dynamic لكي نعيد بيانات لارافل للكنترولر
  Future<dynamic> login(String email, String password) async {
    try {
      final response = await _dio.post(
        AppConstants.baseUrl + AppConstants.loginEndpoint,
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'ngrok-skip-browser-warning': 'true',
          },
        ),
      );

      if (response.data['status'] == true) {
        box.write('token', response.data['token']);
        box.write('restaurant_id', response.data['restaurant_id']);
        return response.data; // نعيد البيانات عند النجاح
      }
      return null;
    } on DioException catch (e) {
      print("فشل الدخول: ${e.response?.data['message']}");
      return null;
    }
  }
}