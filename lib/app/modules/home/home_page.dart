import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/app/components/appbar_widget.dart';
import 'package:food_app/app/modules/home/home_controller.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

import 'widgets/card_popular_item_widget.dart';
import 'widgets/card_product_restaurants_widget.dart';
import 'widgets/form_title_widget.dart';
import 'widgets/menu_item_widget.dart';
import 'widgets/type_product_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: AppbarWidget()),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "What would you like\nto order",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              height: 90.0,
              color: MyColors.background,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => TextFormField(
                        focusNode: controller.myFocusNode,
                        cursorColor: MyColors.orange,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: MyColors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          prefixIconColor: controller.isFocused.value
                              ? MyColors.orange
                              : null,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 32.0,
                          ),
                          hintText: "Find for food or restaurant...",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/Filter.svg")),
                    ),
                  ),
                ],
              ),
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) => Obx(
                          () => MenuItemWidget(
                            boxColor: controller.tabIndex.value == index
                                ? MyColors.orange
                                : Colors.white,
                            titleColor: controller.tabIndex.value == index
                                ? Colors.white
                                : Colors.black,
                            icon: controller.menuItem[index].icon,
                            title: controller.menuItem[index].title,
                            onTap: () => controller.changeTabIndex(index),
                          ),
                        ),
                      ),
                    ),
                    FormTitleWidget(
                      title: "Featured Restaurants",
                      button: 'View all',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 229,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 16),
                        itemCount: controller.productRestaurants.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var featured = controller.productRestaurants[index];

                          return CardFeaturedRestaurant(
                            image: featured.image!,
                            restaurants: featured.restaurant!,
                            timeDelivery: featured.timeDelivery!,
                            rate: featured.rate.toString(),
                            reviewed: featured.reviewed.toString(),
                            child: SizedBox(
                              height: 22,
                              child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder:
                                    (BuildContext context, int indexType) {
                                  return TypeProductWidget(
                                    type: featured.type![indexType],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    FormTitleWidget(
                      title: "Popular Item",
                      button: 'View all',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 215,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 16),
                        itemBuilder: (BuildContext context, int index) {
                          var popularItem = controller.popular[index];

                          return CardPopularItemWidget(
                            image: popularItem.image!,
                            price: popularItem.price.toString(),
                            rate: popularItem.rate.toString(),
                            reviewed: popularItem.reviewed.toString(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
