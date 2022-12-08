import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gamebook/app/controllers/nonPlayed_controller.dart';
import 'package:gamebook/app/data/models/game.dart';
import 'package:gamebook/app/data/providers/game_provider.dart';

class NonPlayedView extends GetView<NonPlayedController> {
  List<Game> playtimeNone = GameProvider.instance.games!
      .where((element) => element.playtimeForever == 0)
      .toList();
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Hiç Oynanmamış Oyunlar"),
      ),
      body: ListView(
        children: [
          for (var game in GameProvider.instance.games!
              .where((element) => element.playtimeForever! == 0))
            ListTile(
              leading: FadeInImage(
                image: NetworkImage(
                    "https://cdn.cloudflare.steamstatic.com/steam/apps/${game.appid!}/header.jpg"),
                placeholder: AssetImage("assets/indir.jpeg"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/indir.jpeg");
                },
              ),
              title: Text(game.name!),
              subtitle: Text("Oyun Süresi: " +
                  (game.playtimeForever! / 60).round().toString() +
                  " Saat"),
            ),
          ...[
            ElevatedButton(
                onPressed: () {
                  late final game = randomGame();
                  Get.defaultDialog(
                      title: "Bu Oyunu Deneyin !",
                      barrierDismissible: true,
                      content: Container(
                        child: Column(
                          children: [
                            Text(game.name!),
                          ],
                        ),
                      ));
                },
                child: Text("Rastgele Oyun Getir"))
          ],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Tüm Oyunlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.highlight_remove),
            label: 'Hiç Oynanmayanlar',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    ));
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.offNamed("/listing");
        break;
      case 1:
        Get.offNamed("/favorite");
        break;
      case 2:
        break;
    }
  }

  Game randomGame() {
    return playtimeNone[_random.nextInt(playtimeNone.length)];
  }
}
