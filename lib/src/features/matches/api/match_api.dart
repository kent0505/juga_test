import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/db/prefs.dart';
import '../../../core/models/match_model.dart';
import '../../../core/models/statistics.dart';
import '../../../core/utils.dart';

class MatchApi {
  final _dio = Dio();
  final _options = Options(
    validateStatus: (status) => true,
    headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': 'aad567230b15af533a80bf5aa13a14cb',
    },
  );

  Future<List<MatchModel>> getMatches() async {
    try {
      final response = await _dio.get(
        'https://v3.football.api-sports.io/fixtures?last=30',
        options: _options,
      );
      List<dynamic> data = response.data['response'];
      await saveLoad(
        DateTime.now().day,
        jsonEncode(response.data),
      );
      List<MatchModel> matches = data.map((json) {
        return MatchModel.fromJson(json);
      }).toList();
      return matches;
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<List<MatchModel>> getJson(String json) async {
    try {
      final jsonData = jsonDecode(json);
      List data = jsonData['response'];
      List<MatchModel> matches = data.map((json) {
        return MatchModel.fromJson(json);
      }).toList();
      return matches;
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<Statistics> fetchStatistics(int id) async {
    try {
      final response = await _dio.get(
        'https://v3.football.api-sports.io/fixtures/statistics?fixture=$id',
        options: _options,
      );
      return Statistics.fromJson(response.data);
    } on Object catch (error, stackTrace) {
      logger(error);
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
