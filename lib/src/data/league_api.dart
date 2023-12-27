import 'dart:math';

import 'package:dio/dio.dart';
import 'package:footbal_app/src/common/const/api_const.dart';
import 'package:footbal_app/src/entity/league.dart';

// https://v3.football.api-sports.io/leagues?season=2023&last=8

class LeagueApi {
  static Future<Iterable<League>> getLeagues() async {
    final rand = Random();
    final dio = Dio();
    const url = '${ApiConst.hostUrl}/leagues?season=2022';
    final response = await dio.get(
      url,
      options: Options(
        headers: ApiConst.header,
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> leagueJson = response.data["response"];
      final leagues =
          leagueJson.map((e) => League.fromMap(e["league"])).toList();
      final countLeagues = rand.nextInt(400);
      print(leagues.length);
      final subLeagues = leagues.sublist(countLeagues, countLeagues + 50);
      return subLeagues;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
