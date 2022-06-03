import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';
import 'package:eletronic_schedule/app/domain/services/custom_notification_service.dart';
import 'package:eletronic_schedule/app/utils/custom_notification_util.dart';
import 'package:get/get.dart';

class NotificationNavigatorBarItemController extends GetxController {
  final customNotificationUtil = CustomNotificationUtil();
  final _customNotificationService = CustomNotificationService();

  final customNotificationList = Future.value(<CustomNotification>[]).obs;
  NotificationNavigatorBarItemController() {
    getList();
  }

  getList(){
    customNotificationList.value =  _customNotificationService.getList();
  }

  remove(CustomNotification customNotification)async{
   await _customNotificationService.remove(customNotification);
   await customNotificationUtil.cancelNotification(customNotification: customNotification);
   await getList();
  }
}
