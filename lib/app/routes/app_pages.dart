import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/pages/edit/bindings/edit_binding.dart';
import '../modules/home/pages/edit/views/edit_view.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.PAGES + _Paths.EDIT,
          page: () => const EditView(),
          binding: EditBinding(),
        ),
      ],
    ),
  ];
}
