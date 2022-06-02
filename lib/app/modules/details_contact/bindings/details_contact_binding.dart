import 'package:get/get.dart';

import '../controllers/details_contact_controller.dart';

class DetailsContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsContactController>(
      () => DetailsContactController(),
    );
  }
}
