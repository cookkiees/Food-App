import 'package:flutter/material.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';
import '../modules/main/controller/main_controller.dart';

class AppbarWidget extends GetView<MainController> {
  const AppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.background,
      elevation: 0,
      leadingWidth: 70,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Deliver to",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              )
            ],
          ),
          const Text(
            "4102 Pretty View Lane",
            style: TextStyle(color: MyColors.orange, fontSize: 16),
          )
        ],
      ),
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
    );
  }
}
