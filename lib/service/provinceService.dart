import 'package:dio/dio.dart';
import '../model/province.dart';
import '../model/apiResponse.dart';


class ProvinceService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/",
    headers: {
      'Token': '8ff33aa8-baa7-11ef-9083-dadc35c0870d',
      'Content-Type': 'application/json',
    },
    responseType: ResponseType.json,
  ));

  Future<List<Province>> fetchProvinces() async {
    try {
      final response = await _dio.get('province');

      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<List<Province>>.fromJson(
          response.data,
              (data) => (data as List).map((e) => Province.fromJson(e)).toList(),
        );
        return apiResponse.data ?? [];
      } else {
        throw Exception('Failed to load provinces. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching provinces: $e');
    }
  }

}
