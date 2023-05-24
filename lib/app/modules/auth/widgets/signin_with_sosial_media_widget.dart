import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_controller.dart';
import 'button_signin_social_widget.dart';

class SignInWithSosialMediaWidget extends GetView<AuthController> {
  const SignInWithSosialMediaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
                child: Divider(
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            )),
            Text("Sign in with"),
            Expanded(
              child: Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ButtonSignInSocialWidget(
              title: "FACEBOOK",
              icon: "facebook",
            ),
            ButtonSignInSocialWidget(
              title: "GOOGLE",
              icon: "google",
              onTap: () {
                controller.handleSignIn();
              },
            ),
          ],
        ),
      ],
    );
  }
}
