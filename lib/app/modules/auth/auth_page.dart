import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../routings/app_routers.dart';
import '../../utils/my_colors.dart';
import 'auth_controller.dart';
import 'widgets/signin_with_sosial_media_widget.dart';
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
                    const SignInWithSosialMediaWidget(),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => Get.toNamed(AppRouters.register),
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
                      onTap: () => Get.toNamed(AppRouters.login),
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
