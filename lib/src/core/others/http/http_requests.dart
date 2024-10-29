import 'package:dio/dio.dart';

import '../../utils.dart';
import 'http_result.dart';

class HttpRequests {
  late Dio _dio;

  HttpRequests() {
    final options = BaseOptions(
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Authorization': 'Bearer $token',
      // },
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    _dio = Dio(options);
  }

  Future<HttpResult> getRequest() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/albums',
      );
      logger(response);
      if (response.statusCode == 200) {
        return Result200(response: response);
      } else {
        return Result400();
      }
    } catch (e) {
      logger(e);
      return Result500();
    }
  }
}
