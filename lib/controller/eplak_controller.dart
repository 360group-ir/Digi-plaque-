import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/component/api_constant.dart';
import 'package:srbiau_digital_plaque/models/epelak_model.dart';

class BusinessController extends GetxController {
  // Rx variables for reactive state management
  var isLoading = true.obs;
  var businessData = Rxn<BusinessData>();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Accept-Language': 'fa',
    },
  ));

  @override
  void onInit() {
    super.onInit();
    fetchBusinessData(); // Fetch data when controller is initialized
  }

  Future<void> fetchBusinessData() async {
    try {
      isLoading(true); // Set loading to true
      final response = await _dio.get(ApiConstant.code);
      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData['status'] == true) {
          businessData.value = BusinessData.fromJson(jsonData['data']);
        } else {
          Get.snackbar('Error', jsonData['message']);
        }
      } else {
        Get.snackbar('Error',
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error fetching data: $e');
    } finally {
      isLoading(false); // Set loading to false
    }
  }
}
