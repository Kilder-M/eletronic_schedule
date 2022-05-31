import 'package:eletronic_schedule/app/data/database/connection.dart';
import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';
import 'package:eletronic_schedule/app/domain/interfaces/custom_notification_interface.dart';
import 'package:sqflite/sqlite_api.dart';

class CustomNotificationDAO implements CustomNotificationInterface {
  Database? _db;

  @override
  Future<List<CustomNotification>> getList() async {
    _db = await Connection.getConnection();
    List<Map<String, dynamic>> queryResult = await _db!.query('notification');
    List<CustomNotification> customNotificationList =
        List.generate(queryResult.length, (index) {
      var row = queryResult[index];
      return CustomNotification.fromMap(row);
    });
    return customNotificationList;
  }

  @override
  remove(CustomNotification customNotification)async {
    _db = await Connection.getConnection();
    var sql = '''
    DELETE FROM connection WHERE id = ?
   ''';
    await _db!.rawDelete(sql, [customNotification.id]);
  }

  @override
  save(CustomNotification customNotification) async{
   _db = await Connection.getConnection();
    String sql;
    if (customNotification.id == null) {
      sql =
          '''INSERT INTO notification(title,body,payload)VALUES(?,?,?)''';
      _db!.rawInsert(sql, [
        customNotification.title,
        customNotification.body,
        customNotification.payload,
      ]);
    } else {
      sql =
          '''UPDATE notification SET title = ?,body = ?, payload = ?,''';
      _db!.rawUpdate(sql, [
        customNotification.title,
        customNotification.body,
        customNotification.payload,
      ]);
    }
  }
}
