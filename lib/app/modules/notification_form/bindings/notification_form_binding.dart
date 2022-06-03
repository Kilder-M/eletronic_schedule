import 'package:get/get.dart';

import '../controllers/notification_form_controller.dart';

class NotificationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationFormController>(
      () => NotificationFormController(),
    );
  }
}
