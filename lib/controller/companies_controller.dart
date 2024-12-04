import 'package:get/get.dart';
import 'package:dio/dio.dart'; // وارد کردن پکیج Dio
import 'package:srbiau_digital_plaque/models/company_list_models.dart'; // مدل‌های شما

class CompanyListController extends GetxController {
  var companyList = <Business>[].obs; // لیست شرکت‌ها
  var isLoading = true.obs; // وضعیت بارگذاری
  var errorMessage = ''.obs; // پیام خطا

  final Dio _dio = Dio(); // ایجاد یک نمونه از Dio


  Future<void> fetchCompanyList(
      {required String building,
      required String floor,
      required String block}) async {
    isLoading.value = true; // شروع بارگذاری
    try {
      // ساخت URL با پارامترها
      final String url =
          'https://360tools.io/epelak/api/srbroshd/businesses?building=$building&floor=$floor&block=$block';

      final response = await _dio.get(url); // ارسال درخواست GET به URL
      if (response.statusCode == 200) {
        CompanyListModel companyListModel =
            CompanyListModel.fromJson(response.data);
        companyList.assignAll(
            companyListModel.data.data); // داده‌ها را به لیست اضافه کنید
      } else {
        errorMessage.value = 'خطا در بارگذاری داده‌ها';
      }
    } catch (e) {
      errorMessage.value = 'خطا: $e';
    } finally {
      isLoading.value = false; // پایان بارگذاری
    }
  }
}
