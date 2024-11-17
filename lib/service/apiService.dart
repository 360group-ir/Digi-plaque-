import 'dart:developer';
import 'package:dio/dio.dart';


class DioService {
  Dio dio = Dio();
  Future<dynamic> getmethod(String url) async {
    dio.options.headers["content-type"] = 'application/json';
    dio.options.headers["Accept"] = '*/*';
    dio.options.headers["Accept-Language"] = 'fa';

    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then(
      (response) {
        log(response.toString());
        return response;
      },
    );
  }


}