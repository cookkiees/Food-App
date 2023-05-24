import 'package:flutter/material.dart';
import 'package:food_app/app/utils/my_colors.dart';

class RatedBoxWidget extends StatelessWidget {
  const RatedBoxWidget({
    super.key,
    required this.rate,
    required this.reviewed,
  });

  final String rate;
  final String reviewed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const Icon(
            Icons.star,
            size: 20.0,
            color: MyColors.gold,
          ),
          Text(
            '($reviewed+)',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
