import 'package:get/get.dart';

import 'package:eletronic_schedule/app/modules/home/controllers/contact_navigator_bar_item_controller.dart';
import 'package:eletronic_schedule/app/modules/home/controllers/notification_navigator_bar_item_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationNavigatorBarItemController>(
      () => NotificationNavigatorBarItemController(),
    );
    Get.lazyPut<ContactNavigatorBarItemController>(
      () => ContactNavigatorBarItemController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
