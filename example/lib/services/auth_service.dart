import 'package:flutter/foundation.dart';

/// API Response Model
class LoginResponse {
  final bool success;
  final String message;
  final String? token;
  final UserData? user;

  LoginResponse({
    required this.success,
    required this.message,
    this.token,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? 'Unknown error',
      token: json['token'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}

/// User Data Model
class UserData {
  final String id;
  final String email;
  final String name;
  final String? avatarUrl;

  UserData({
    required this.id,
    required this.email,
    required this.name,
    this.avatarUrl,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      avatarUrl: json['avatar_url'],
    );
  }
}

/// Authentication Service
/// 
/// Contoh implementasi untuk integrasi dengan API backend
/// 
/// Penggunaan:
/// ```dart
/// final authService = AuthService();
/// 
/// final response = await authService.login(
///   email: 'user@example.com',
///   password: 'password123',
/// );
/// 
/// if (response.success) {
///   // Save token
///   await _saveToken(response.token);
///   // Navigate to home
/// } else {
///   // Show error message
///   showError(response.message);
/// }
/// ```
class AuthService {
  static const String _baseUrl = 'https://api.example.com';
  static const String _loginEndpoint = '/auth/login';
  static const String _registerEndpoint = '/auth/register';
  static const String _logoutEndpoint = '/auth/logout';

  /// Login dengan email dan password
  /// 
  /// Returns: LoginResponse dengan token jika berhasil
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      // Simulate API call
      // Dalam production, ganti dengan actual HTTP request
      
      if (kDebugMode) {
        print('Attempting login with email: $email');
      }

      // Simulated delay untuk meniru network latency
      await Future.delayed(const Duration(seconds: 2));

      // Mock validation
      if (email == 'demo@example.com' && password == 'password123') {
        return LoginResponse(
          success: true,
          message: 'Login berhasil',
          token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
          user: UserData(
            id: '1',
            email: email,
            name: 'Demo User',
            avatarUrl: 'https://api.dicebear.com/7.x/avataaars/svg?seed=$email',
          ),
        );
      } else {
        return LoginResponse(
          success: false,
          message: 'Email atau password salah',
        );
      }

      // Actual HTTP implementation (uncomment untuk production)
      /*
      final response = await http.post(
        Uri.parse('$_baseUrl$_loginEndpoint'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return LoginResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        return LoginResponse(
          success: false,
          message: 'Email atau password salah',
        );
      } else {
        return LoginResponse(
          success: false,
          message: 'Server error: ${response.statusCode}',
        );
      }
      */
    } catch (e) {
      if (kDebugMode) {
        print('Login error: $e');
      }
      return LoginResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  /// Register akun baru
  Future<LoginResponse> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (kDebugMode) {
        print('Attempting registration with email: $email');
      }

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Validation
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        return LoginResponse(
          success: false,
          message: 'Semua field harus diisi',
        );
      }

      if (password.length < 6) {
        return LoginResponse(
          success: false,
          message: 'Password minimal 6 karakter',
        );
      }

      // Mock success
      return LoginResponse(
        success: true,
        message: 'Registrasi berhasil, silakan login',
        token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
        user: UserData(
          id: '${DateTime.now().millisecondsSinceEpoch}',
          email: email,
          name: name,
        ),
      );
    } catch (e) {
      return LoginResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  /// Logout
  Future<bool> logout({required String token}) async {
    try {
      if (kDebugMode) {
        print('Logging out...');
      }

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Clear local storage
      // await _clearToken();

      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Logout error: $e');
      }
      return false;
    }
  }

  /// Forgot Password
  Future<LoginResponse> forgotPassword({required String email}) async {
    try {
      if (kDebugMode) {
        print('Requesting password reset for: $email');
      }

      await Future.delayed(const Duration(seconds: 2));

      return LoginResponse(
        success: true,
        message: 'Link reset password telah dikirim ke email Anda',
      );
    } catch (e) {
      return LoginResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  /// Reset Password
  Future<LoginResponse> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      if (kDebugMode) {
        print('Resetting password with token: $token');
      }

      await Future.delayed(const Duration(seconds: 2));

      if (newPassword.length < 6) {
        return LoginResponse(
          success: false,
          message: 'Password minimal 6 karakter',
        );
      }

      return LoginResponse(
        success: true,
        message: 'Password berhasil direset, silakan login',
      );
    } catch (e) {
      return LoginResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  /// Verify Email
  Future<LoginResponse> verifyEmail({required String token}) async {
    try {
      if (kDebugMode) {
        print('Verifying email with token: $token');
      }

      await Future.delayed(const Duration(seconds: 2));

      return LoginResponse(
        success: true,
        message: 'Email berhasil diverifikasi',
      );
    } catch (e) {
      return LoginResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }

  /// Refresh Token
  Future<LoginResponse> refreshToken({required String refreshToken}) async {
    try {
      if (kDebugMode) {
        print('Refreshing token...');
      }

      await Future.delayed(const Duration(seconds: 1));

      return LoginResponse(
        success: true,
        message: 'Token berhasil diperbarui',
        token: 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      );
    } catch (e) {
      return LoginResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }
}
