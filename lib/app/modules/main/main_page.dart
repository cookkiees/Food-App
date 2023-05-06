import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/app/modules/home/home_page.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';
import 'controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (controller) {
      return Scaffold(
        backgroundColor: MyColors.background,
        body: IndexedStack(
          index: controller.tabIndex,
          children: [
            const HomePage(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(splashColor: Colors.transparent),
          child: BottomNavigationBar(
            currentIndex: controller.tabIndex,
            selectedItemColor: MyColors.orange,
            unselectedItemColor: Colors.black,
            onTap: controller.changeTabIndex,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Rec.svg",
                  height: 32,
                  colorFilter: controller.tabIndex == 0
                      ? const ColorFilter.mode(MyColors.orange, BlendMode.srcIn)
                      : ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Locations.svg",
                  height: 32,
                  colorFilter: controller.tabIndex == 1
                      ? const ColorFilter.mode(MyColors.orange, BlendMode.srcIn)
                      : ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Cart.svg",
                  height: 32,
                  colorFilter: controller.tabIndex == 2
                      ? const ColorFilter.mode(MyColors.orange, BlendMode.srcIn)
                      : ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SvgPicture.asset(
                    "assets/icons/Favorite.svg",
                    height: 32,
                    colorFilter: controller.tabIndex == 3
                        ? const ColorFilter.mode(
                            MyColors.orange, BlendMode.srcIn)
                        : ColorFilter.mode(
                            Colors.grey.shade400, BlendMode.srcIn),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/Notif.svg",
                  height: 32,
                  colorFilter: controller.tabIndex == 4
                      ? const ColorFilter.mode(MyColors.orange, BlendMode.srcIn)
                      : ColorFilter.mode(Colors.grey.shade400, BlendMode.srcIn),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    });
  }
}
