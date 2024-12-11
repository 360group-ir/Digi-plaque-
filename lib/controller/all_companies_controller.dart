import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:srbiau_digital_plaque/models/all_companies_model.dart';

class AllBusinessController extends GetxController {
  var businesses = <Business>[].obs;
  var allBusinesses = <Business>[];
  var isLoading = false.obs;
  var dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchBusinesses();
  }

  void fetchBusinesses() async {
    try {
      isLoading(true);
      final response = await dio.get(
          'https://360tools.io/epelak/api/srbroshd/businesses');
      if (response.statusCode == 200 && response.data['status']) {
        var data = response.data['data']['data'] as List;
        allBusinesses = data.map((e) => Business.fromJson(e)).toList();
        businesses.value = allBusinesses;
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

  void searchBusinesses(String query) {
    if (query.isEmpty) {
      businesses.value = allBusinesses;
    } else {
      businesses.value = allBusinesses
          .where((business) => business.name
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
  }
}
