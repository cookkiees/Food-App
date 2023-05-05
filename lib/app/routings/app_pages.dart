import 'package:get/get.dart';
import '../modules/main/main_binding.dart';
import '../modules/main/widgets/zoom_drawer_widget.dart';
import 'app_routers.dart';

class AppPages {
  static const initial = AppRouters.main;

  static final routes = [
    GetPage(
      name: AppRouters.main,
      page: () => const ZoomDrawePage(),
      binding: MainBinding(),
    ),
  ];
}
