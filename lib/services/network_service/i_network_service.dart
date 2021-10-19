import 'package:postbird/models/api_response.dart';

abstract class INetworkService {
  Future<ApiResponse?> get(String url,
      {dynamic body, Map<String, String>? headers});
  Future<ApiResponse?> post(String url,
      {dynamic body, Map<String, String>? headers});
  Future<ApiResponse?> patch(String url,
      {dynamic body, Map<String, String>? headers});
  Future<ApiResponse?> delete(String url,
      {dynamic body, Map<String, String>? headers});
}
