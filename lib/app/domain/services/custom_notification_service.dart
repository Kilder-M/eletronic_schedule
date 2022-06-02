import 'package:eletronic_schedule/app/data/database/dao/custom_notification_dao.dart';
import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';
import 'package:eletronic_schedule/app/domain/exceptions/domain_layer_exception.dart';

class CustomNotificationService{
  final _customNotification = CustomNotificationDAO();

  Future<CustomNotification>save(CustomNotification customNotification) async {
    validateTime(customNotification.time);
    validateTitle(customNotification.title);
    return await _customNotification.save(customNotification);
  }

  remove(CustomNotification customNotification) async {
    await _customNotification.remove(customNotification);
  }

  Future<List<CustomNotification>> getList() async {
    return await _customNotification.getList();
  }

  validateTitle(String? title) {
    var max = 50;
    var min = 2;

    if (title == '' || title == null) {
      throw DomainLayerException(message: "O título é obrigatório.");
    } else if (title.length > max) {
      throw DomainLayerException(
          message: "O título deve possuir no máximo $max caracters.");
    } else if (title.length < min) {
      throw DomainLayerException(
          message: "O título deve possuir no mínimo $min caracters.");
    }
  }
  validateTime(String? time) {
    var max = 10;
    var min = 8;

    if (time == '' || time == null) {
      throw DomainLayerException(message: "O tempo é obrigatório.");
    }
  }
}