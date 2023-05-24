import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';

class NormalTextfieldWidget extends StatelessWidget {
  const NormalTextfieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
  });
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 16),
        TextFormField(
          obscureText: obscureText,
          cursorColor: MyColors.orange,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: MyColors.orange),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {},
        )
      ],
    );
  }
}
