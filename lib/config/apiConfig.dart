import 'package:dio/dio.dart';

class ApiConfig {
  static BaseOptions get options => BaseOptions(
    baseUrl: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/",
    headers: {
      'Token': 'ff33aa8-baa7-11ef-9083-dadc35c0870d',
      'content-type': 'application/json',
    },
    responseType: ResponseType.json,
    validateStatus: (status) => true,
  );
}
