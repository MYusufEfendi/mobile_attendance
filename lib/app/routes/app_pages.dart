import 'package:get/get.dart';

import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAP;

  static final routes = [
    GetPage(
      name: _Paths.MAP,
      page: () => MapView(),
      binding: MapBinding(),
    ),
  ];
}
