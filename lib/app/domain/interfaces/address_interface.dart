import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';

abstract class AddressInterface {
  Future<List<Address>> find();
  save(Address address);
  remove(Address address);
}
