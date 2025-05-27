import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/apiResponse.dart';
import '../model/district.dart';

class DistrictService extends GetxService{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/",
    headers: {
      'Token': '8ff33aa8-baa7-11ef-9083-dadc35c0870d',
      'content-type': 'application/json',
    },
    responseType: ResponseType.json,
  ));

  Future<List<District>> fetchDistricts(int provinceID) async {
    try{
      final response = await _dio.post('district',
      data: {
        'province_id': provinceID,
      });
      if(response.statusCode == 200) {
        final apiResponse = ApiResponse<List<District>>.fromJson(
          response.data,
              (data) =>
              (data as List).map((e) => District.fromJson(e)).toList(),
        );
        return apiResponse.data ?? [];
      }else{
        throw Exception('Failed to load districts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching districts: $e');
    }
  }
}