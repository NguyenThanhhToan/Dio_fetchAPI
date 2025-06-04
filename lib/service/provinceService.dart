import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../interceptor/apiClient.dart';
import '../model/response/provinceResponse.dart';
import '../model/response/apiResponse.dart';

class ProvinceService extends GetxService {
  final Dio _dio = ApiClient.instance;

  Future<List<ProvinceResponse>> fetchProvinces() async {
    try {
      final response = await _dio.get(
        'province',
        // options: Options(extra: {'auth': false},
        // )
      );
      final apiResponse = ApiResponse<List<ProvinceResponse>>.fromJson(
        response.data,
            (data) => (data as List)
            .map((e) => ProvinceResponse.fromJson(e as Map<String, dynamic>))
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

