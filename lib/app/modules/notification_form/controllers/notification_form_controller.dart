import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';
import 'package:eletronic_schedule/app/domain/services/custom_notification_service.dart';
import 'package:eletronic_schedule/app/utils/custom_notification_util.dart';
import 'package:eletronic_schedule/app/utils/datetime_convert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationFormController extends GetxController {
  final _customNotificationService = CustomNotificationService();
  TimesConverter durationConverter = TimesConverter();
  CustomNotificationUtil customNotificationUtil = CustomNotificationUtil();
  CustomNotification customNotification =
      CustomNotification(title: '', body: '', time: '');

  var notificationTimeInseconds = 0;

  bool _titleIsValid = false;
  bool _timeIsValid = false;

  bool get isValid => _titleIsValid && _timeIsValid;

  NotificationFormController();

  Future<CustomNotification> save() async {
    return await _customNotificationService.save(customNotification);
  }

  String validateTime(String? time) {
    try {
      _customNotificationService.validateTime(time);
      _timeIsValid = true;
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  String validateTitle(String? title) {
    try {
      _customNotificationService.validateTitle(title);
      _titleIsValid = true;
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  int getSecondsNotification(TimeOfDay? timeOfDay) {
    return notificationTimeInseconds =
        durationConverter.convertTimeOfDayToSeconds(timeOfDay??TimeOfDay.now()) -
            durationConverter.convertTimeOfDayToSeconds(TimeOfDay.now());
  }
}
