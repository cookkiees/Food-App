import 'package:food_app/app/modules/auth/auth_binding.dart';
import 'package:food_app/app/modules/auth/auth_page.dart';
import 'package:get/get.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/widgets/zoom_drawer_widget.dart';
import 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.auth;

  static final routes = [
    GetPage(
      name: AppRouters.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRouters.main,
      page: () => const ZoomDrawePage(),
      binding: MainBinding(),
    ),
  ];
}
