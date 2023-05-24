import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:food_app/app/modules/home/controller/home_controller.dart';
import 'package:food_app/app/utils/my_colors.dart';

import '../../../components/normal_button_widget.dart';

class FoodDetailPage extends GetView<HomeController> {
  const FoodDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final foodDetail = Get.arguments;
    return Scaffold(
      backgroundColor: MyColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: MyColors.background,
            leadingWidth: 70,
            expandedHeight: 200,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 4,
                bottom: 4,
                right: 8,
              ),
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
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 14),
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: MyColors.orange,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                foodDetail.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              padding: const EdgeInsets.all(16),
              color: MyColors.background,
              height: 70,
              child: Text(
                foodDetail.foodName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: MyColors.gold,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          foodDetail.rate.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "(${foodDetail.reviewed.toString()}+)",
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "See Review",
                          style: TextStyle(
                            color: MyColors.orange,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.orange,
                                ),
                              ),
                              TextSpan(
                                text: foodDetail.price.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.orange,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      foodDetail.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Choice of Add On",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 24),
                      shrinkWrap: false,
                      itemCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.asset(foodDetail.addOnImage[index]),
                          title: Text(
                            foodDetail.addOn[index],
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: SizedBox(
                            width: 70,
                            child: Row(
                              children: [
                                Text(
                                  "+\$${foodDetail.addOnPrice[index].toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                Obx(() {
                                  return InkWell(
                                    onTap: () {
                                      controller.changeTabIndex(index);
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      padding: const EdgeInsets.all(2.5),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: controller.tabIndex.value ==
                                                index
                                            ? Border.all(color: MyColors.orange)
                                            : Border.all(color: Colors.grey),
                                      ),
                                      child: CircleAvatar(
                                        radius: 5,
                                        backgroundColor:
                                            controller.tabIndex.value == index
                                                ? MyColors.orange
                                                : Colors.transparent,
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  NormalButtonWidget(
                    onTap: () {
                      var item = foodDetail.id;
                      controller.addItemToCart(item);
                      Get.snackbar(
                        foodDetail.foodName,
                        'Add to cart',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: MyColors.orange,
                        colorText: Colors.white,
                        borderRadius: 10.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        snackStyle: SnackStyle.FLOATING,
                        animationDuration: const Duration(milliseconds: 300),
                      );
                    },
                    width: 160,
                    icon: "assets/icons/Cart.svg",
                    title: "Add to Cart",
                    alignment: Alignment.bottomCenter,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
