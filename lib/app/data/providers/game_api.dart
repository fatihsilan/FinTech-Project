import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gamebook/app/data/models/games_response.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://api.steampowered.com/";

class GameApiClient {
  final _api_key = dotenv.env['API_KEY'];
  Future<GameResponse?> getAllGames(String userId) async {
    String url =
        "IPlayerService/GetOwnedGames/v0001/?key=$_api_key&include_appinfo=true&steamid=$userId&format=json";
    final response = await http.get(Uri.parse(baseUrl + url));
    if (response.statusCode == 200) {
      GameResponse gr = GameResponse.fromJson(jsonDecode(response.body));
      return Future.value(gr);
    } else {
      return Future.value(null);
    }
  }
}
