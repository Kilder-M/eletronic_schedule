import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/services/address_service.dart';
import 'package:eletronic_schedule/app/domain/services/contact_service.dart';
import 'package:get/get.dart';

class ContactFormController extends GetxController {
  final _contactService = ContactService();
  final _addressService = AddressService();

  Contact contact = Get.arguments ?? Contact(name: '', phone: '');
  Address address = Get.arguments ?? Address();
  bool _nameIsValid = false;
  bool _phoneIsValid = false;

  bool get isValid => _nameIsValid && _phoneIsValid ;

  ContactFormController();

  saveContact(Contact contact) async {
    await _contactService.save(contact);
  }
 Future<Address> saveAddress(Address address) async {
    return await _addressService.save(address);
  }

  String validateName(String? name) {
    try {
      _contactService.validateName(name);
      _nameIsValid = true;
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  String validatePhone(String? phone) {
    try {
      _contactService.validatePhone(phone);
      _phoneIsValid = true;
      return '';
    } catch (e) {
      return e.toString();
    }
  }
}
