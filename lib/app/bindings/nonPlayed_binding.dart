import 'package:get/get.dart';
import 'package:gamebook/app/controllers/nonPlayed_controller.dart';

class NonPlayedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NonPlayedController());
  }
}
