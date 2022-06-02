import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';

abstract class CustomNotificationInterface {
  Future<List<CustomNotification>> getList();
  Future<CustomNotification> save(CustomNotification customNotification);
  remove(CustomNotification customNotification);
}
