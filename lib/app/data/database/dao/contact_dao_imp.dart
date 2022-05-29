import 'package:eletronic_schedule/app/data/database/connection.dart';
import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/interfaces/contact_interface.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAOImp implements ContactInterface {
  Database? _db;
  @override
  Future<List<Contact>> getList() async {
    _db = await Connection.getConnection();
    List<Map<String, dynamic>> queryResult = await _db!.query('contact');
    List<Contact> contactList = List.generate(queryResult.length, (index) {
      var row = queryResult[index];
      return Contact.fromMap(row);
    });
    return contactList;
  }

  @override
  remove(Contact contact) async {
    _db = await Connection.getConnection();
    var sql = '''
    DELETE FROM contact WHERE id = ?
   ''';
    await _db!.rawDelete(sql, [contact.id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.getConnection();
    String sql;
    if (contact.id == null) {
      sql =
          '''INSERT INTO contact(address_id,image_url,email,phone,name)VALUES(?,?,?,?)''';
      _db!.rawInsert(sql, [
        contact.addressId,
        contact.imageUrl,
        contact.email,
        contact.imageUrl,
        contact.phone,
        contact.name
      ]);
    } else {
      sql =
          '''UPDATE contact SET address_id = ?, image_url = ?, email = ? phone = ?, name = ? ''';
      _db!.rawUpdate(sql, [
        contact.addressId,
        contact.imageUrl,
        contact.email,
        contact.phone,
        contact.name
      ]);
    }
  }
}
