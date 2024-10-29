import 'package:dio/dio.dart';

abstract class HttpResult {}

class Result200 extends HttpResult {
  final Response response;
  Result200({required this.response});
}

class Result400 extends HttpResult {}

class Result500 extends HttpResult {}
