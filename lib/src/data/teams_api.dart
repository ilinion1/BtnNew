import 'package:dio/dio.dart';
import 'package:footbal_app/src/common/const/api_const.dart';
import 'package:footbal_app/src/entity/team.dart';

class TeamsApi {
  static Future<Iterable<Team>> getTeams(int leagueId, String season) async {
    final dio = Dio();
    final url = '${ApiConst.hostUrl}/standings?league=$leagueId&season=$season';
    final response = await dio.get(
      url,
      options: Options(headers: ApiConst.header),
    );

    if (response.statusCode == 200) {
      final List<dynamic>? teamsJson =
          (response.data["response"] as List<dynamic>).isEmpty
              ? []
              : response.data["response"][0]["league"]["standings"][0];
      if (teamsJson == null) return [];
      final teams = teamsJson.map(
        (team) => Team(
          id: team["team"]["id"] as int,
          image: team["team"]["logo"] as String,
          name: team["team"]["name"] as String,
          matches: team["all"]["played"],
          wins: team["all"]["win"],
          loses: team["all"]["lose"],
          draws: team["all"]["draw"],
          pt: team["points"],
        ),
      );
      return teams;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
