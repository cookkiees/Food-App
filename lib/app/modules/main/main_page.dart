import 'package:flutter/material.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

import 'controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.background,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: IconButton(
              onPressed: () => controller.toggleDrawer(),
              icon: const Icon(
                Icons.space_dashboard,
                color: Colors.black,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/avatar.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
