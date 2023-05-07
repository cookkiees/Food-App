import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class MenuItemWidget extends GetView<HomeController> {
  const MenuItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.boxColor,
    required this.titleColor,
    this.onTap,
  });

  final String title;
  final String icon;
  final Color boxColor;
  final Color titleColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 110,
          width: 70,
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(icon),
              Text(
                title,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: titleColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
