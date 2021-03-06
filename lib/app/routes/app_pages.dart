import 'package:get/get.dart';

import '../modules/contact_form/bindings/contact_form_binding.dart';
import '../modules/contact_form/views/contact_form_view.dart';
import '../modules/details_contact/bindings/details_contact_binding.dart';
import '../modules/details_contact/views/details_contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notification_form/bindings/notification_form_binding.dart';
import '../modules/notification_form/views/notification_form_view.dart';

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
    GetPage(
      name: _Paths.DETAILS_CONTACT,
      page: () => DetailsContactView(),
      binding: DetailsContactBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_FORM,
      page: () => NotificationFormView(),
      binding: NotificationFormBinding(),
    ),
  ];
}
