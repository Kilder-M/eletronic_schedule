import 'package:eletronic_schedule/app/data/database/dao/address_dao_imp.dart';
import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';

class AddressService {
  final _addressDAO = AddressDAOImp();

  Future<Address> save(Address address) async {
    return await _addressDAO.save(address);
  }

  remove(int addressId) async {
    await _addressDAO.remove(addressId);
  }

  Future<List<Address>> getList() async {
    return await _addressDAO.getList();
  }

  Future<Address> getById(int? id) async {
    return await _addressDAO.getById(id);
  }
}
