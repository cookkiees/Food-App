import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  var selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  final List<ZoomDrawerMenu> menus = [
    ZoomDrawerMenu(title: 'My Orders', icon: 'Document'),
    ZoomDrawerMenu(title: 'My Profile', icon: 'Profile'),
    ZoomDrawerMenu(title: 'Delivery Address', icon: 'Location'),
    ZoomDrawerMenu(title: 'Payment Methods', icon: 'Wallet'),
    ZoomDrawerMenu(title: 'Contact Us', icon: 'Message'),
    ZoomDrawerMenu(title: 'Settings', icon: 'Setting'),
    ZoomDrawerMenu(title: 'Helps & FAQs', icon: 'Helps'),
  ];
}

class ZoomDrawerMenu {
  final String title;
  final String icon;

  ZoomDrawerMenu({required this.title, required this.icon});
}
