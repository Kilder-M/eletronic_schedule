import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/route_manager.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class CustomNotificationUtil {
  late FlutterLocalNotificationsPlugin localNotificationPlugin;
  late AndroidNotificationDetails androidDetails;
  late IOSNotificationDetails iosNotificationDetails;

  CustomNotificationUtil() {
    localNotificationPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _setupTimeZone();
    await _initializeNotifications();
  }

  Future<void> _setupTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await localNotificationPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onSelectNotification: _onSelectNotification,
    );
  }

  _onSelectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Get.toNamed(payload);
    }
  }

  showNotification({required CustomNotification customNotification,required Duration duration}) {
    final date = DateTime.now().add(duration);
    androidDetails = const AndroidNotificationDetails(
      'notification_id',
      'notification',
      channelDescription: 'this channel is for notification!',
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );
    localNotificationPlugin.zonedSchedule(
      customNotification.id!,
      customNotification.title,
      customNotification.body,
      tz.TZDateTime.from(date,tz.local),
      NotificationDetails(android: androidDetails),
      payload: customNotification.payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
  }

  cancelNotification({required CustomNotification customNotification}){
    localNotificationPlugin.cancel(customNotification.id!);
  }

  checkForNotifications()async{
    final details = await localNotificationPlugin.getNotificationAppLaunchDetails();
    if(details != null && details.didNotificationLaunchApp){
      _onSelectNotification(details.payload);
    }
  }
}
