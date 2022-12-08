class Game {
  int? appid;
  String? name;
  int? playtimeForever;
  String? imgIconUrl;
  int? playtimeWindowsForever;
  int? playtimeMacForever;
  int? playtimeLinuxForever;
  int? rtimeLastPlayed;

  Game(
      {this.appid,
      this.name,
      this.playtimeForever,
      this.imgIconUrl,
      this.playtimeWindowsForever,
      this.playtimeMacForever,
      this.playtimeLinuxForever,
      this.rtimeLastPlayed});

  Game.fromJson(Map<String, dynamic> json) {
    appid = json['appid'];
    name = json['name'];
    playtimeForever = json['playtime_forever'];
    imgIconUrl = json['img_icon_url'];
    playtimeWindowsForever = json['playtime_windows_forever'];
    playtimeMacForever = json['playtime_mac_forever'];
    playtimeLinuxForever = json['playtime_linux_forever'];
    rtimeLastPlayed = json['rtime_last_played'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['name'] = this.name;
    data['playtime_forever'] = this.playtimeForever;
    data['img_icon_url'] = this.imgIconUrl;
    data['playtime_windows_forever'] = this.playtimeWindowsForever;
    data['playtime_mac_forever'] = this.playtimeMacForever;
    data['playtime_linux_forever'] = this.playtimeLinuxForever;
    data['rtime_last_played'] = this.rtimeLastPlayed;
    return data;
  }
}
