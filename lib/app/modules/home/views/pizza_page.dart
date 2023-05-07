import 'package:flutter/material.dart';
import 'package:food_app/app/modules/home/controller/home_controller.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

class PizzaPage extends GetView<HomeController> {
  const PizzaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: MyColors.background,
            expandedHeight: 250,
            leadingWidth: 70,
            leading: Padding(
              padding:
                  const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 8),
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Fast',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                            TextSpan(
                              text: '\nFood',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MyColors.orange,
                                fontSize: 32,
                              ),
                            ),
                            TextSpan(
                              text: '\n80 type of pizza',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              background: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  "assets/images/Pizza-1.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
