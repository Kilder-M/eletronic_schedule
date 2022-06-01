import 'package:get/get.dart';

import '../controllers/contact_form_controller.dart';

class ContactFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactFormController>(
      () => ContactFormController(),
    );
  }
}
