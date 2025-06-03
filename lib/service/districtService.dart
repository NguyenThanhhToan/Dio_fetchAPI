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

      final apiResponse = ApiResponse<List<DistrictResponse>>.fromJson(
        response.data,
            (data) => (data as List)
            .map((e) => DistrictResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

      if (apiResponse.code == 200) {
        return apiResponse.data ?? [];
      } else {
        throw Exception('${apiResponse.message} (code: ${apiResponse.code})');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

