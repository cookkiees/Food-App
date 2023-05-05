import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

import '../controller/mydrawer_controller.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/images/avatar-1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Farion Wick",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "farionwick@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: controller.menus.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.selectIndex(index);
                      },
                      child: SizedBox(
                        child: ListTile(
                          title: Text(
                            controller.menus[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          leading: SvgPicture.asset(
                            "assets/icons/${controller.menus[index].icon}.svg",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 140,
                  height: 50,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: MyColors.orange,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28.0,
                        backgroundColor: MyColors.background,
                        child: SvgPicture.asset(
                          "assets/icons/Logout.svg",
                          height: 26,
                        ),
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: MyColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
