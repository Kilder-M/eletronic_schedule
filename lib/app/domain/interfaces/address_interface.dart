import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';

abstract class AddressInterface {
  Future<List<Address>> getList();
  Future<Address> getById(int? id);
  save(Address address);
  remove(int addressId);
}
