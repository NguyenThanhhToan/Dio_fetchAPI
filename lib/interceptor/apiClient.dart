import 'package:dio/dio.dart';

class ApiClient {
  static Dio get instance {
    final dio = Dio(
      BaseOptions(
//        baseUrl: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/",
        baseUrl: "https://inta/api/v1/address/district-id",
        responseType: ResponseType.json,
        validateStatus: (_) => true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.extra['startTime'] = DateTime.now();
          options.headers['Token'] = '8ff33aa8-baa7-11ef-9083-dadc35c0870d';
          options.headers['Content-Type'] = 'application/json';
          print('[REQUEST] ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          final startTime = response.requestOptions.extra['startTime'] as DateTime?;
          final endTime = DateTime.now();
          if (startTime != null) {
            final duration = endTime.difference(startTime);
            print('[RESPONSE] ${response.statusCode} ${response.requestOptions.path}');
            print('[DURATION] ${duration.inMilliseconds} ms');
          }
          return handler.next(response);
        },
        onError: (error, handler) {
          final startTime = error.requestOptions.extra['startTime'] as DateTime?;
          final endTime = DateTime.now();
          if (startTime != null) {
            final duration = endTime.difference(startTime);
            print('[ERROR] ${error.response?.statusCode} ${error.requestOptions.path}');
            print('[DURATION] ${duration.inMilliseconds} ms');
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}



// Global Configuration
// Interceptors
// FormData
// Request Cancellation
// Retrying Requests
// File Downloading
// Timeout
// Https certificate verification
// Http2
