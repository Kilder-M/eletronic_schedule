import 'package:eletronic_schedule/app/data/database/connection.dart';
import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/interfaces/address_interface.dart';
import 'package:sqflite/sqlite_api.dart';

class AddressDAOImp implements AddressInterface {
  Database? _db;

  @override
  Future<List<Address>> getList() async {
    _db = await Connection.getConnection();
    List<Map<String, dynamic>> queryResult = await _db!.query('address');
    List<Address> addressList = List.generate(queryResult.length, (index) {
      var row = queryResult[index];
      return Address.fromMap(row);
    });
    return addressList;
  }

  @override
  remove(int addressId) async {
    _db = await Connection.getConnection();
    var sql = '''
    DELETE FROM address WHERE id = ?
   ''';
    await _db!.rawDelete(sql, [addressId]);
  }

  @override
  Future<Address> save(Address address) async {
    _db = await Connection.getConnection();
    String sql;
    if (address.id == null) {
      sql =
          '''INSERT INTO address(city,state,zip_code,street_address,street_address_number,complement)VALUES(?,?,?,?,?,?)''';
      address.id = await _db!.rawInsert(sql, [
        address.city,
        address.state,
        address.zipCode,
        address.streetAddress,
        address.streetAddressNumber,
        address.complement
      ]);
      return address;
    } else {
      sql =
          '''UPDATE address SET city = ?,state = ?, zip_code = ?, street_address = ?, street_address_number = ?,complement = ? WHERE id = ?''';
     await _db!.rawUpdate(sql, [
        address.city,
        address.state,
        address.zipCode,
        address.streetAddress,
        address.streetAddressNumber,
        address.complement,
        address.id
      ]);
      return address;
    }
  }

  @override
  Future<Address> getById(int? id) async {
    if (id != null) {
      _db = await Connection.getConnection();
      List<Map<String, dynamic>> queryResult =
          await _db!.query('address', where: 'id = ?', whereArgs: [id]);
      List<Address> addressList = List.generate(queryResult.length, (index) {
        var row = queryResult[index];
        return Address.fromMap(row);
      });
      return addressList.first;
    }
    return Address();
  }
}
