import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';
import 'rated_box_widget.dart';

class CardPopularItemWidget extends StatelessWidget {
  const CardPopularItemWidget({
    super.key,
    required this.image,
    required this.price,
    required this.rate,
    required this.reviewed,
    required this.foodName,
    required this.addOn,
    this.onTap,
  });
  final String image;
  final String price;
  final String rate;
  final String reviewed;
  final String foodName;
  final String addOn;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 215,
          width: 154,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(16)),
          child: Stack(
            children: [
              SizedBox(
                height: 150,
                width: 154,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 26,
                      padding: const EdgeInsets.only(left: 4.0, right: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: Text(
                        " \$$price",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 14.0,
                      backgroundColor: MyColors.orange,
                      child: Icon(
                        Icons.favorite,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 8,
                bottom: 55,
                child: ClipRRect(
                  child: Material(
                    elevation: 0.5,
                    borderRadius: BorderRadius.circular(32),
                    child: RatedBoxWidget(rate: rate, reviewed: reviewed),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      addOn,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
