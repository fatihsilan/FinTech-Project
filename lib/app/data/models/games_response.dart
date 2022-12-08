import 'package:gamebook/app/data/models/game.dart';

class GameResponse {
  Response? response;

  GameResponse({this.response});

  GameResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  int? gameCount;
  List<Game>? games;

  Response({this.gameCount, this.games});

  Response.fromJson(Map<String, dynamic> json) {
    gameCount = json['game_count'];
    if (json['games'] != null) {
      games = <Game>[];
      json['games'].forEach((v) {
        games!.add(new Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_count'] = this.gameCount;
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
