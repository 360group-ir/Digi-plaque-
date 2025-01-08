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
      final List<dynamic> data = response.data['data']['data'];
      allBusinesses = data.map((e) => Business.fromJson(e)).toList();
      businesses.value = allBusinesses;
      print("Businesses fetched successfully: ${businesses.length} items");
    } else {
      Get.snackbar('Error', 'Failed to fetch data');
      print("Failed to fetch data: "); 
    }
  } catch (e) {
    Get.snackbar('Error', e.toString());
    print("Error fetching businesses: $e");
  } finally {
    isLoading(false);
  }
}


void searchBusinesses(String query) {
  if (query.isEmpty) {
    businesses.value = allBusinesses;
    print("Search query is empty, showing all businesses.");
  } else {
    final filteredBusinesses = allBusinesses
        .where((business) => business.name
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    
    businesses.value = filteredBusinesses;
    print("Filtered businesses: ${filteredBusinesses.length} items found for query '$query'");
  }
}

}
