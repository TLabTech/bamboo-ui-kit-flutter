import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure Storage Service
/// 
/// Menyimpan sensitive data seperti JWT tokens dengan aman
/// menggunakan native secure storage
/// 
/// Dependencies yang diperlukan:
/// ```yaml
/// dependencies:
///   flutter_secure_storage: ^9.0.0
/// ```
class SecureStorageService {
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_data';
  static const String _rememberMeKey = 'remember_me';

  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: const AndroidOptions(
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
      resetOnError: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  /// Save authentication token
  static Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: _tokenKey, value: token);
    } catch (e) {
      throw Exception('Failed to save token: $e');
    }
  }

  /// Get saved token
  static Future<String?> getToken() async {
    try {
      return await _storage.read(key: _tokenKey);
    } catch (e) {
      throw Exception('Failed to retrieve token: $e');
    }
  }

  /// Save refresh token
  static Future<void> saveRefreshToken(String refreshToken) async {
    try {
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    } catch (e) {
      throw Exception('Failed to save refresh token: $e');
    }
  }

  /// Get refresh token
  static Future<String?> getRefreshToken() async {
    try {
      return await _storage.read(key: _refreshTokenKey);
    } catch (e) {
      throw Exception('Failed to retrieve refresh token: $e');
    }
  }

  /// Save user data
  static Future<void> saveUserData(String userData) async {
    try {
      await _storage.write(key: _userDataKey, value: userData);
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }

  /// Get user data
  static Future<String?> getUserData() async {
    try {
      return await _storage.read(key: _userDataKey);
    } catch (e) {
      throw Exception('Failed to retrieve user data: $e');
    }
  }

  /// Save remember me preference
  static Future<void> saveRememberMe(bool rememberMe) async {
    try {
      await _storage.write(
        key: _rememberMeKey,
        value: rememberMe.toString(),
      );
    } catch (e) {
      throw Exception('Failed to save remember me: $e');
    }
  }

  /// Get remember me preference
  static Future<bool> getRememberMe() async {
    try {
      final value = await _storage.read(key: _rememberMeKey);
      return value == 'true';
    } catch (e) {
      return false;
    }
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    try {
      final token = await getToken();
      return token != null && token.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Clear all data (logout)
  static Future<void> clearAll() async {
    try {
      await Future.wait([
        _storage.delete(key: _tokenKey),
        _storage.delete(key: _refreshTokenKey),
        _storage.delete(key: _userDataKey),
        _storage.delete(key: _rememberMeKey),
      ]);
    } catch (e) {
      throw Exception('Failed to clear storage: $e');
    }
  }

  /// Clear specific key
  static Future<void> clear(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      throw Exception('Failed to clear key: $e');
    }
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    try {
      final value = await _storage.read(key: key);
      return value != null;
    } catch (e) {
      return false;
    }
  }

  /// Get all keys (debug only)
  static Future<Map<String, String>> readAll() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      throw Exception('Failed to read all: $e');
    }
  }
}
