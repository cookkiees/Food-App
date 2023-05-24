import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  var tabIndex = 0;

  void changeTabIndex(index) {
    tabIndex = index;
    update();
  }
}
