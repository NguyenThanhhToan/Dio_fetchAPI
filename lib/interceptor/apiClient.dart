import 'package:dio/dio.dart';

class ApiClient {
  static Dio get instance {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/",
        // baseUrl: "https://de.vn/shiip/public-api/master-data/",
        responseType: ResponseType.json,
        validateStatus: (_) => true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    Future<Response> retryRequest(Dio dioInstance, RequestOptions requestOptions) async {
      requestOptions.extra['retried'] = true;
      try {
        print('[RETRY] Retrying request: ${requestOptions.method} ${requestOptions.path}');
        final response = await dioInstance.fetch(requestOptions);
        return response;
      } catch (e) {
        print('[RETRY FAILED] Request failed again.');
        rethrow;
      }
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.extra['startTime'] = DateTime.now();
          final needAuth = options.extra['auth'] ?? true;
          if (needAuth) {
            options.headers['Token'] = '8ff33aa8-baa7-11ef-9083-dadc35c0870d';
            options.headers['Content-Type'] = 'application/json';
          }
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
        onError: (error, handler) async {
          final startTime = error.requestOptions.extra['startTime'] as DateTime?;
          final endTime = DateTime.now();
          if (startTime != null) {
            final duration = endTime.difference(startTime);
            print('[ERROR] ${error.response?.statusCode} ${error.requestOptions.path}');
            print('[DURATION] ${duration.inMilliseconds} ms');
          }

          if (error.requestOptions.extra['retried'] != true) {
            try {
              final response = await retryRequest(dio, error.requestOptions);
              return handler.resolve(response);
            } catch (e) {
              return handler.next(error);
            }
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
