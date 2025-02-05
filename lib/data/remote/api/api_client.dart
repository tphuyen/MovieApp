import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/res/widgets/constants.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;
  ApiClient();

  ApiClient._internal();
  final String token = '';

  Future<Response> request({
    required String endpoint,
    required DioMethod method,
    Map<String, dynamic>? param,
    String? contentType,
    FormData? formData,
  }) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: Constants.baseUrl,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          headers: {
            if (token.isNotEmpty) HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          validateStatus: (_) => true,
        ),
      );
      dio.interceptors.add(
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
      Response response;
      switch (method) {
        case DioMethod.post:
          response = await dio.post(
            endpoint,
            data: param ?? formData,
          );
          break;

        case DioMethod.get:
          response = await dio.get(
            endpoint,
            queryParameters: param,
          );
          break;

        case DioMethod.put:
          response = await dio.put(
            endpoint,
            data: param ?? formData,
          );
          break;

        case DioMethod.delete:
          response = await dio.delete(
            endpoint,
            data: param ?? formData,
          );
          break;

        default:
          response = await dio.post(
            endpoint,
            data: param ?? formData,
          );
          break;
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
enum DioMethod { post, get, put, delete }


