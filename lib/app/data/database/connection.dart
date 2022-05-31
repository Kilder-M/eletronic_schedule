import 'package:eletronic_schedule/app/data/database/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> getConnection() async {
    if (_db == null) {
      String path =
          join(await getDatabasesPath(), 'eletronic_schedule_data_base');
      deleteDatabase(path);
      return _db =
          await openDatabase(path, version: 1, onCreate: (db, v) async {
        await db.execute(createAddressTable);
        await db.execute(createContactTable);
        await db.execute(createCustomNotificationTable);
        
      });
    }
    return _db!;
  }
}
