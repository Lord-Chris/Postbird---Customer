import 'package:dio/dio.dart';
import 'package:postbird/core/api_strings.dart';
import 'package:postbird/models/api_response.dart';

import 'i_network_service.dart';
import 'network_logger.dart';

class NetworkService extends INetworkService {
  Dio _dio = Dio();

  NetworkService() {
    _dio = Dio();
    _dio.options.baseUrl = ApiStrings.base_url;
    _dio.options.receiveTimeout = 60 * 1000;
    _dio.options.sendTimeout = 60 * 1000;
    _dio.interceptors.add(NetworkInterceptor());
  }

  @override
  Future<ApiResponse?> delete(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    try {
      final res = await _dio.delete(
        url,
        queryParameters: body,
        options: Options(headers: headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse();
      }
      throw res.statusMessage!;
    } catch (e) {
      print(e.toString());
      // throw Failure();
    }
  }

  @override
  Future<ApiResponse?> get(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    try {
      final res = await _dio.get(
        url,
        queryParameters: body,
        options: Options(headers: headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse();
      }
      throw res.statusMessage!;
    } catch (e) {
      print(e.toString());
      // throw Failure();
    }
  }

  @override
  Future<ApiResponse?> patch(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    try {
      final res = await _dio.patch(
        url,
        queryParameters: body,
        options: Options(headers: headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse();
      }
      throw res.statusMessage!;
    } catch (e) {
      print(e.toString());
      // throw Failure();
    }
  }

  @override
  Future<ApiResponse?> post(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) async {
    try {
      final res = await _dio.get(
        url,
        queryParameters: body,
        options: Options(headers: headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse();
      }
      throw res.statusMessage!;
    } catch (e) {
      print(e.toString());
      // throw Failure();
    }
  }
}
