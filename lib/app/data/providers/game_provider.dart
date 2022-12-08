import 'package:gamebook/app/data/models/game.dart';

class GameProvider {
  GameProvider._() {}
  static GameProvider _instance = GameProvider._();
  factory GameProvider() => _instance;
  static GameProvider get instance => _instance;
  List<Game>? games;
}
