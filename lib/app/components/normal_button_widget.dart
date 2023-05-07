import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/my_colors.dart';

class NormalButtonWidget extends StatelessWidget {
  const NormalButtonWidget({
    super.key,
    required this.width,
    required this.icon,
    required this.title,
    required this.alignment,
  });
  final double width;
  final String icon;
  final String title;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Align(
        alignment: alignment,
        child: Container(
          width: width,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: MyColors.orange,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28.0,
                backgroundColor: MyColors.background,
                child: SvgPicture.asset(
                  icon,
                  height: 26,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: MyColors.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
