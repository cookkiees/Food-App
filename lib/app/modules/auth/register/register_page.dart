import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routings/app_routers.dart';
import '../../../utils/my_colors.dart';
import '../auth_controller.dart';
import '../widgets/normal_textformfield_widget.dart';
import '../widgets/signin_with_sosial_media_widget.dart';

class RegisterPage extends GetView<AuthController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.background,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "SIGN UP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                const SizedBox(height: 16),
                const NormalTextfieldWidget(
                  title: 'Fullname',
                  hintText: 'Enter your fullname',
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                const NormalTextfieldWidget(
                  title: 'E-mail',
                  hintText: 'Enter your email',
                  obscureText: false,
                ),
                const SizedBox(height: 16),
                Obx(
                  () => NormalTextfieldWidget(
                    title: 'Password',
                    hintText: 'Enter your Password',
                    obscureText: controller.isObscure.value,
                    suffixIcon: IconButton(
                      icon: Icon(controller.isObscure.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () => controller.toggleObscure(),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.orange,
                  minimumSize: const Size(250, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text("SIGN UP"),
              ),
            ),
            Column(
              children: [
                Center(
                  child: InkWell(
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
                ),
                const SizedBox(height: 50),
                const SignInWithSosialMediaWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
