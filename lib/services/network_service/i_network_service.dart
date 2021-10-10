import 'package:postbird/models/api_response.dart';

abstract class INetworkService {
  Future<ApiResponse?> get(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers});
  Future<ApiResponse?> post(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers});
  Future<ApiResponse?> patch(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers});
  Future<ApiResponse?> delete(String url,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers});
}
