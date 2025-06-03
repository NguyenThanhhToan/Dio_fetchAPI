import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../config/apiConfig.dart';
import '../model/response/apiResponse.dart';
import '../model/response/districtResponse.dart';
import '../model/request/districtRequest.dart';

class DistrictService extends GetxService {
  final Dio _dio = Dio(ApiConfig.options);

  Future<List<DistrictResponse>> fetchDistricts(DistrictRequest request) async {
    try {
      final response = await _dio.post('district', data: request.toJson());

      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<List<DistrictResponse>>.fromJson(
          response.data,
              (data) => (data as List)
              .map((e) => DistrictResponse.fromJson(e as Map<String, dynamic>))
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
