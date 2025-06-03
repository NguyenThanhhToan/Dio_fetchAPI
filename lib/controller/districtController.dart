import 'package:get/get.dart';
import '../model/request/districtRequest.dart';
import '../model/response/districtResponse.dart';
import '../service/districtService.dart';

class DistrictController extends GetxController {
  final DistrictService districtService;

  DistrictController(this.districtService);

  final districts = <DistrictResponse>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args is int) {
      fetchDistricts(args);
    }
  }

  Future<void> fetchDistricts(int provinceId) async {
    final request = DistrictRequest(provinceId: provinceId);
    isLoading.value = true;

    try {
      final result = await districtService.fetchDistricts(request);
      districts.assignAll(result);
    } catch (e) {
      print("Failed to fetch districts: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
