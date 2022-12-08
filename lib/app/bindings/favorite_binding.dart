import 'package:get/get.dart';
import 'package:gamebook/app/controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
  }
}
