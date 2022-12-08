import 'package:get/get.dart';
import 'package:gamebook/app/bindings/favorite_binding.dart';
import 'package:gamebook/app/bindings/initial_binding.dart';
import 'package:gamebook/app/bindings/listing_binding.dart';
import 'package:gamebook/app/bindings/nonPlayed_binding.dart';
import 'package:gamebook/app/ui/favorite_view.dart';
import 'package:gamebook/app/ui/initial_view.dart';
import 'package:gamebook/app/ui/listing_view.dart';
import 'package:gamebook/app/ui/nonPlayed_view.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => InitialView(),
        bindings: [InitialBinding()]),
    GetPage(
        name: Routes.LISTING,
        page: () => ListingView(),
        bindings: [ListingBinding()]),
    GetPage(
        name: Routes.NONPLAYED,
        page: () => NonPlayedView(),
        bindings: [NonPlayedBinding()]),
    GetPage(
        name: Routes.FAVORITE,
        page: () => FavoriteView(),
        bindings: [FavoriteBinding()])
  ];
}
