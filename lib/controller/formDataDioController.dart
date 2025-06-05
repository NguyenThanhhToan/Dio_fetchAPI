import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:basic_app/service/formDataDioService.dart';

class FormDataDioController extends GetxController {
  final UploadData uploadData = Get.put(UploadData());

  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  Rx<dio.Response?> response = Rx<dio.Response?>(null);

  RxString title = ''.obs;
  RxString categoryIds = ''.obs;
  RxString authorId = ''.obs;

  RxnString imagePath = RxnString(null);
  RxnString pdfFilePath = RxnString(null);

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      imagePath.value = result.files.single.path!;
    }
  }

  Future<void> pickPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      pdfFilePath.value = result.files.single.path!;
    }
  }

  Future<void> uploadBook() async {
    if (imagePath.value == null && pdfFilePath.value == null) {
      errorMessage.value = 'chọn ít nhất một file ảnh hoặc PDF';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    response.value = null;

    try {
      final res = await uploadData.uploadBook(
        title: title.value.trim(),
        categoryIds: categoryIds.value.trim(),
        authorId: authorId.value.trim(),
        imagePath: imagePath.value,
        pdfFilePath: pdfFilePath.value,
      );
      response.value = res;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
