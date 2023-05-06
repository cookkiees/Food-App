import 'package:flutter/material.dart';
import 'package:food_app/app/modules/auth/auth_controller.dart';
import 'package:food_app/app/routings/app_routers.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';

import 'widgets/button_signin_social_widget.dart';
import 'widgets/title_widget.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black12,
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fitWidth,
            opacity: 0.4,
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () => Get.offAndToNamed(AppRouters.main),
                      style: ElevatedButton.styleFrom(
                        elevation: 0.5,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: MyColors.orange, fontSize: 17),
                      ),
                    ),
                  ),
                ),
                const TitleWidget(),
                Column(
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
                          onTap: () => controller.handleSignIn(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.orange,
                        minimumSize: const Size(320, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text(
                        "Start with email or phone",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Alread have an account?',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: MyColors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
