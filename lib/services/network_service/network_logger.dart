import 'dart:developer';

import 'package:dio/dio.dart';

class NetworkInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('---ENDPOINT: ' + err.requestOptions.uri.toString());
    log('---STATUSCODE: ' + err.error.toString());
    log('---MESSAGE: ' + (err.response?.data ?? err.message).toString());
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('>>>METHOD: ' + options.method);
    log('>>>ENDPOINT: ' + options.uri.toString());
    // log('HEADERS: ' + options.headers.toString());
    log('>>>DATA: ' + (options.data ?? options.queryParameters).toString());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('<<<ENDPOINT: ' + response.requestOptions.uri.toString());
    log('<<<STATUSCODE: ' + response.statusCode.toString());
    // log('<<<DATA: ' + response.data.toString());
    handler.next(response);
  }
}
