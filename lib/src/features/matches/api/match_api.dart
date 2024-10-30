import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/models/match_model.dart';
import '../../../core/utils.dart';

class MatchApi {
  final dio = Dio();

  Future<Result> getMatches() async {
    try {
      final response = await dio.get(
        'https://v3.football.api-sports.io/fixtures?last=30',
        options: Options(
          validateStatus: (status) => true,
          headers: {
            'x-rapidapi-host': 'v3.football.api-sports.io',
            'x-rapidapi-key': 'aad567230b15af533a80bf5aa13a14cb',
          },
        ),
      );
      logger(response.data.toString());
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['response'];
        List<MatchModel> matches = data.map((json) {
          return MatchModel.fromJson(json);
        }).toList();
        return SuccessResult(
          matches: matches,
          jsonData: jsonEncode(response.data),
        );
      } else {
        return ErrorResult();
      }
    } catch (e) {
      logger(e.toString());
      return ErrorResult();
    }
  }

  Future<Result> getJson(String json) async {
    try {
      final jsonData = jsonDecode(json);
      List data = jsonData['response'];
      List<MatchModel> matches = data.map((json) {
        return MatchModel.fromJson(json);
      }).toList();
      return JsonResult(matches: matches);
    } catch (e) {
      logger(e.toString());
      return ErrorResult();
    }
  }
}

abstract class Result {}

class SuccessResult extends Result {
  final List<MatchModel> matches;
  final String jsonData;
  SuccessResult({
    required this.matches,
    required this.jsonData,
  });
}

class JsonResult extends Result {
  final List<MatchModel> matches;
  JsonResult({required this.matches});
}

class ErrorResult extends Result {}
