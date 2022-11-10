import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenSecureStorage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static const String _tokenKey = 'token';

  static Future saveSecureToken(String token) async {
    await storage.write(
      key: _tokenKey,
      value: token,
      aOptions: _getAndroidOptions(),
    );
    readSecureToken();
  }

  static Future<String?> readSecureToken() async {
    return await storage.read(
      key: _tokenKey,
      aOptions: _getAndroidOptions(),
    );
  }

  static Future deleteSecureToken() async {
    await storage.delete(
      key: _tokenKey,
      aOptions: _getAndroidOptions(),
    );
    readSecureToken();
  }
}
