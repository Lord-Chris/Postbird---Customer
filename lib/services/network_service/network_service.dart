import 'package:dio/dio.dart';
import 'package:postbird/core/index.dart';

import 'network_logger.dart';

class NetworkService extends INetworkService {
  Dio _dio = Dio();
  final _headers = {'Accept': 'application/json'};

  NetworkService() {
    _dio = Dio();
    _dio.options.baseUrl = ApiStrings.base_url;
    _dio.options.receiveTimeout = 60 * 1000;
    _dio.options.sendTimeout = 60 * 1000;
    _dio.interceptors.add(NetworkInterceptor());
  }

  @override
  Future<ApiResponse?> delete(String url,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final res = await _dio.delete(
        url,
        data: body,
        options: Options(headers: _headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(data: res.data);
      }
      throw res.statusMessage!;
    } on DioError catch (e) {
      print(e.toString());
      throw Failure(e.response?.data['error']);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse?> get(String url,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final res = await _dio.get(
        url,
        queryParameters: body,
        options: Options(headers: _headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(data: res.data);
      }
      throw res.statusMessage!;
    } on DioError catch (e) {
      print(e.toString());
      throw Failure(e.response?.data['error']);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse?> patch(String url,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final res = await _dio.patch(
        url,
        data: body,
        options: Options(headers: _headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(data: res.data);
      }
      throw res.statusMessage!;
    } on DioError catch (e) {
      print(e.toString());
      throw Failure(e.response?.data['error']);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<ApiResponse?> post(String url,
      {dynamic body, Map<String, String>? headers}) async {
    try {
      if (headers != null) {
        _headers.addAll(headers);
      }
      final res = await _dio.post(
        url,
        data: body,
        options: Options(headers: _headers),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return ApiResponse(data: res.data);
      }
      throw res.statusMessage!;
    } on DioError catch (e) {
      print(e.toString());
      throw Failure(e.response?.data['error']);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }
}
