import 'package:get/get.dart';

import 'controller/main_controller.dart';
import 'controller/mydrawer_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(MyDrawerController());
  }
}
