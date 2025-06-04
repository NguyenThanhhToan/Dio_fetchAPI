import 'package:dio/dio.dart' as dio;

Future<dio.Response> retryRequest(dio.Dio dioInstance, dio.RequestOptions requestOptions) async {
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
