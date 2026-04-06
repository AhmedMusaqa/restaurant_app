// import 'package:flutter/material.dart';
// import 'package:restaurant_app/features/auth/data/auth_service.dart';
//
// class AuthProvider extends ChangeNotifier {
//   final AuthService _authService = AuthService();
//   bool _isLoading = false;
//   String? _error;
//
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//
//   Future<bool> login(String email, String password) async {
//     try {
//       _setLoading(true);
//       _error = null;
//       final success = await _authService.login(email, password);
//       return success;
//     } catch (e) {
//       _error = e.toString().replaceAll("Exception: ", "");
//       return false;
//     } finally {
//       _setLoading(false);
//     }
//   }
//
//   Future<bool> signUp(String name, String email, String password) async {
//     try {
//       _setLoading(true);
//       _error = null;
//       final success = await _authService.register(name, email, password);
//       return success;
//     } catch (e) {
//       _error = e.toString().replaceAll("Exception: ", "");
//       return false;
//     } finally {
//       _setLoading(false);
//     }
//   }
//
//   void _setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
// }
