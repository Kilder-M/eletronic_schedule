import 'package:eletronic_schedule/app/data/database/dao/contact_dao_imp.dart';
import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/exceptions/domain_layer_exception.dart';

class ContactService {
  final _contactDAO = ContactDAOImp();

  save(Contact contact, {Address? address}) async {
    validatePhone(contact.phone);
    // validateState(address.city, address.state, address.zipCode, address.streetAddress, address.streetAddressNumber, address.complement);
    // validateCity(address.city, address.state, address.zipCode, address.streetAddress, address.streetAddressNumber, address.complement);
    await _contactDAO.save(contact);
  }

  remove(Contact contact) async {
    await _contactDAO.remove(contact);
  }

  Future<List<Contact>> getList() async {
    return await _contactDAO.getList();
  }

  getByName(String name) async {
    await _contactDAO.getListByName(name);
  }

  getByPhone(String phone) async {
    await _contactDAO.getListByPhone(phone);
  }

  validateName(String? name) {
    var max = 50;
    var min = 2;

    if (name == '' || name == null) {
      throw DomainLayerException(message: "O nome é obrigatório.");
    } else if (name.length > max) {
      throw DomainLayerException(
          message: "O nome deve possuir no máximo $max caracters.");
    } else if (name.length < min) {
      throw DomainLayerException(
          message: "O nome deve possuir no mínimo $min caracters.");
    }
  }

  validatePhone(String? phone) {
    var format = RegExp(
        r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$'); // (99) 9 9999-9999
    if (phone == '' || phone == null) {
      throw DomainLayerException(message: 'O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw DomainLayerException(
          message: 'O número inserido é invalido');
    }
  }

  

  validateCity(
    String? city,
    String? state,
    String? zipCode,
    String? streetAddress,
    String? streetAddressNumber,
    String? complement,
  ) {
    if (city == null && state != null ||
        zipCode != null ||
        streetAddress != null ||
        streetAddressNumber != null ||
        complement != null) {
      throw DomainLayerException(message: 'O campo Cidade é obrigatório.');
    }
  }

  validateState(
    String? city,
    String? state,
    String? zipCode,
    String? streetAddress,
    String? streetAddressNumber,
    String? complement,
  ) {
    if (state == null && city != null ||
        zipCode != null ||
        streetAddress != null ||
        streetAddressNumber != null ||
        complement != null) {
      throw DomainLayerException(message: 'O campo Estado é obrigatório.');
    }
  }
}
