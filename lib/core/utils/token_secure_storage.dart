import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenSecureStorage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static const String _tokenKey = 'token';

  static Future saveSecureToken(String token) async {
    await storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> readSecureToken() async {
    return await storage.read(key: _tokenKey);
  }
}
