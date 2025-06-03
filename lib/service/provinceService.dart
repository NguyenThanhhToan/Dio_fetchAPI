import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../config/apiConfig.dart';
import '../model/response/provinceResponse.dart';
import '../model/response/apiResponse.dart';

class ProvinceService extends GetxService {
  final Dio _dio = Dio(ApiConfig.options);

  Future<List<ProvinceResponse>> fetchProvinces() async {
    try {
      final response = await _dio.get('province');

      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<List<ProvinceResponse>>.fromJson(
          response.data,
              (data) => (data as List)
              .map((e) => ProvinceResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
        return apiResponse.data ?? [];
      } else {
        throw Exception(
            'Failed to load districts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching districts: $e');
    }
  }
}
