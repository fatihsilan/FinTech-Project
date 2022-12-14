import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gamebook/app/controllers/favorite_controller.dart';
import 'package:gamebook/app/data/providers/game_provider.dart';

class FavoriteView extends GetView<FavoriteController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Favori Oyunlar"),
      ),
      body: ListView(
        children: [
          for (var game in GameProvider.instance.games!
              .where((element) => element.playtimeForever! >= 6000))
            ListTile(
              leading: FadeInImage(
                image: NetworkImage(
                    "https://cdn.cloudflare.steamstatic.com/steam/apps/${game.appid!}/header.jpg"),
                placeholder: AssetImage("assets/cercevesiz.png"),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/cercevesiz.png");
                },
              ),
              title: Text(game.name!),
              subtitle: Text("Oyun Süresi: " +
                  (game.playtimeForever! / 60).round().toString() +
                  " Saat"),
            ),
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
        currentIndex: 1,
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
        break;
      case 2:
        Get.offNamed("/nonplayed");
        break;
    }
  }
}
