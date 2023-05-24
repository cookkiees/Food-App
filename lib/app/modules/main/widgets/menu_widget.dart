import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../components/normal_button_widget.dart';
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
                            style: const TextStyle(fontWeight: FontWeight.w700),
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
            const NormalButtonWidget(
              width: 140,
              icon: "assets/icons/Logout.svg",
              title: "Logout",
              alignment: Alignment.bottomLeft,
            )
          ],
        ),
      ),
    );
  }
}
