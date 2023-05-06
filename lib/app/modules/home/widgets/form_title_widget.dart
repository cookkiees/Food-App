import 'package:flutter/material.dart';

class FormTitleWidget extends StatelessWidget {
  const FormTitleWidget({
    super.key,
    required this.title,
    required this.button,
    this.onPressed,
  });
  final String title;
  final String button;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextButton(
            onPressed: () {},
            child: Text(button),
          )
        ],
      ),
    );
  }
}
