import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/res/widgets/constants.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;
  ApiClient._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      validateStatus: (_) => true,
    ),
  );

  ApiClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['api_key'] = Constants.apiKey;
          if (kDebugMode) {
            print("REQUEST[${options.method}] => PATH: ${options.path}");
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          }
          return handler.next(response);
        },
        onError: (DioError error, handler) {
          if (kDebugMode) {
            print("ERROR[${error.response?.statusCode}] => MESSAGE: ${error.message}");
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      return await _dio.get(endpoint, queryParameters: params);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
