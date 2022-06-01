import 'package:get/get.dart';

import '../modules/contact_form/bindings/contact_form_binding.dart';
import '../modules/contact_form/views/contact_form_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_FORM,
      page: () => ContactFormView(),
      binding: ContactFormBinding(),
    ),
  ];
}
