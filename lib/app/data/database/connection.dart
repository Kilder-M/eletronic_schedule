import 'package:eletronic_schedule/app/data/database/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database> getProduct() async {
    if (_db == null) {
      String path =
          join(await getDatabasesPath(), 'eletronic_schedule_data_base');
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(createAddressTable);
        db.execute(createContactTable);
      });
    }
    return _db!;
  }
}
