import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:food_app/app/modules/main/controller/main_controller.dart';
import 'package:get/get.dart';

import '../../../utils/my_colors.dart';
import '../controller/mydrawer_controller.dart';
import '../main_page.dart';
import 'menu_widget.dart';

class ZoomDrawePage extends GetView<MyDrawerController> {
  const ZoomDrawePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const MainPage(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -0.0,
        menuBackgroundColor: MyColors.background,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.68,
      ),
    );
  }
}
