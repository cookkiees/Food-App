import 'package:flutter/material.dart';
import 'package:food_app/app/modules/home/widgets/card_popular_item_widget.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemCount: 2,
        padding: const EdgeInsets.only(left: 16, right: 16),
        itemBuilder: (BuildContext context, int index) {
          return CardPopularItemWidget(
            width: MediaQuery.of(context).size.width,
            imageHeight: 200,
            height: 270,
            image: "assets/images/Pizza-2.png",
            price: "10.35",
            rate: "4.5",
            reviewed: "22",
            foodName: "Chicken Hawaiian",
            addOn: "Chicken, Cheese and pineapple",
          );
        },
      ),
    );
  }
}
