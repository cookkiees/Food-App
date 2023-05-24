import 'package:flutter/material.dart';
import 'package:food_app/app/utils/my_colors.dart';
import 'package:get/get.dart';
import '../../routings/app_routers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRouters.auth);
    });
    return Scaffold(
      backgroundColor: MyColors.orange,
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: MyColors.background,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(height: 16),
              Image.asset("assets/images/Food.png")
            ],
          ),
        ),
      ),
    );
  }
}
