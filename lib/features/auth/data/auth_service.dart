class AuthService {
  // Mock database
  final List<Map<String, String>> _users = [];

  // LOGIN
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    final user = _users.firstWhere(
          (u) => u['email'] == email,
      orElse: () => {},
    );

    if (user.isEmpty) {
      throw Exception("Account not found");
    }

    if (user['password'] != password) {
      throw Exception("Incorrect password");
    }

    return true;
  }

  // REGISTER
  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    final existingUser =
    _users.any((u) => u['email'] == email);

    if (existingUser) {
      throw Exception("Email already registered");
    }

    _users.add({
      'name': name,
      'email': email,
      'password': password,
    });

    return true;
  }

  Future<bool> verifyCode(String code) async {
    await Future.delayed(const Duration(seconds: 1));
    return code == "1234";
  }
}
