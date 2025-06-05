import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class UploadData extends GetxService {
  final dio.Dio _dio = dio.Dio();

  String? token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJsZXBodWMwNGIzQGdtYWlsLmNvbSIsInJvbGUiOiJST0xFX1VTRVIiLCJleHAiOjE3NDkwOTE0ODF9.IGz3po53OehJYxGFj7NAtIbEa_-yneUnnXSmpTbqGDQzqQrJRpiKY5dM4fkMkIokISXhdl2BwDTIr_aqXLlSXQ';

  Future<UploadData> init() async {
    return this;
  }

  Future<dio.Response> uploadBook({
    required String title,
    required String categoryIds,
    required String authorId,
    String? pdfFilePath,
    String? imagePath,
  }) async {
    if (token == null) {
      throw Exception('Token is not set');
    }

    final formMap = <String, dynamic>{
      'title': title,
      'categoryIds': categoryIds,
      'authorId': authorId,
    };

    if (imagePath != null && imagePath.isNotEmpty) {
      formMap['image'] = await dio.MultipartFile.fromFile(
        imagePath,
        filename: imagePath.split('/').last,
      );
    }

    if (pdfFilePath != null && pdfFilePath.isNotEmpty) {
      formMap['pdfFile'] = await dio.MultipartFile.fromFile(
        pdfFilePath,
        filename: pdfFilePath.split('/').last,
      );
    }

    final formData = dio.FormData.fromMap(formMap);

    return await _dio.post(
      'https://adfa-115-73-215-102.ngrok-free.app/api/v1/book',
      data: formData,
      options: dio.Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
