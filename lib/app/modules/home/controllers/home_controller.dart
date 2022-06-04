import 'package:eletronic_schedule/app/utils/custom_notification_util.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final notificationUtil = CustomNotificationUtil();
  var selectedindex = 0.obs;

  HomeController() {
    notificationUtil.checkForNotifications();
  }

  void onTapBottomBarIcon(int index) {
    selectedindex.value = index;
  }
}
