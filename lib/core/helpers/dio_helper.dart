import 'package:dio/dio.dart';
import '../utils/constance.dart';

import '../network/api_constance.dart';

class DioHelper {
  static Dio dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
        //connectTimeout: 30 * 1000,
        //receiveTimeout: 30 * 1000,
      ),
    );

    // dio.interceptors.add(LogInterceptor(
    //     request: true,
    //     requestBody: true,
    //     responseBody: true,
    //     error: true,
    //     requestHeader: false,
    //     responseHeader: false,
    //     ));
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': apiDataLanguage,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
    String? lang,
  }) async {
    dio.options.headers = {
      'lang': apiDataLanguage,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      path,
      queryParameters: query,
    );
  }

  static Future<Response> updateData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': apiDataLanguage,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.put(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': apiDataLanguage,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.delete(path);
  }
}
