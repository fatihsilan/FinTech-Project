import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:gamebook/app/data/models/games_response.dart';
import 'package:gamebook/app/data/providers/game_api.dart';
import 'package:gamebook/app/data/providers/game_provider.dart';

class InitialController extends GetxController {
  final initFormKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  late final GameApiClient gameClient;
  InitialController() {
    gameClient = Get.find();
  }

  Future<void> getData() async {
    String id = idController.text;
    final games = await gameClient.getAllGames(id);
    if (games != null) {
      if (games.response != null) {
        GameProvider.instance.games = games.response!.games;
        Get.offAndToNamed("/listing");
      }
    }
  }
}
