import 'package:flutter/material.dart';

import '../../../utils/my_colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 200),
      child: RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Welcome to',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '\nFood',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: MyColors.orange,
              ),
            ),
            TextSpan(
              text: '\nYour favourite foods delivered\nfast at your door.',
              style: TextStyle(
                height: 1.6,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
