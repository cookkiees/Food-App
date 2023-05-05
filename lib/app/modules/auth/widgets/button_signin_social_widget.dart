import 'package:flutter/material.dart';

class ButtonSignInSocialWidget extends StatelessWidget {
  const ButtonSignInSocialWidget({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(32)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/$icon.png",
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
