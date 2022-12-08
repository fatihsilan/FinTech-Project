import 'package:get/get.dart';
import 'package:gamebook/app/data/providers/game_api.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameApiClient(), fenix: true);
  }
}
