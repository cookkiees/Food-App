import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class CardFeaturedRestaurant extends GetView<HomeController> {
  const CardFeaturedRestaurant({
    super.key,
    required this.image,
    required this.restaurants,
    required this.timeDelivery,
    required this.child,
    required this.rate,
    required this.reviewed,
    this.onTap,
  });

  final String image;
  final String restaurants;
  final String timeDelivery;
  final String rate;
  final String reviewed;
  final Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 229,
          width: 266,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(image),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 26,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Row(
                            children: [
                              Text(
                                rate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const Icon(
                                Icons.star,
                                size: 20.0,
                                color: Colors.yellow,
                              ),
                              Text(
                                '($reviewed+)',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12),
                              ),
                            ],
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
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          restaurants,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          'assets/icons/Verify.svg',
                          height: 16,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Delivery.svg',
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Free Delivery',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          'assets/icons/Time.svg',
                          height: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          timeDelivery,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    child
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
