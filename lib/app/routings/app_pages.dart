import 'package:food_app/app/modules/auth/auth_binding.dart';
import 'package:food_app/app/modules/auth/auth_page.dart';
import 'package:food_app/app/modules/auth/login/login_page.dart';
import 'package:food_app/app/modules/home/controller/home_biniding.dart';
import 'package:food_app/app/modules/home/home_page.dart';
import 'package:food_app/app/modules/home/views/food_detail_page.dart';
import 'package:get/get.dart';
import '../modules/auth/register/register_page.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/widgets/zoom_drawer_widget.dart';
import 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.main;

  static final routes = [
    GetPage(
      name: AppRouters.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRouters.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRouters.register,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRouters.main,
      page: () => const ZoomDrawePage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRouters.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouters.detail,
      page: () => const FoodDetailPage(),
      binding: HomeBinding(),
    ),
  ];
}
