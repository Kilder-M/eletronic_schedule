import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/services/contact_service.dart';
import 'package:get/get.dart';

class ContactFormController extends GetxController {
  final _contactService = ContactService();

  Contact contact = Get.arguments ?? Contact(name: '', phone: '');
  bool _nameIsValid = false;
  bool _phoneIsValid = false;
  // late bool _cityIsValid;
  // late bool _stateIsValid;

  bool get isValid => _nameIsValid && _phoneIsValid ;

  ContactFormController();

  save(Contact contact) async {
    await _contactService.save(contact);
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

  // String? validateCity(String email) {
  //   try {
  //     _contactService.validateEmail(email);
  //     _emailIsValid = true;
  //     return null;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }String? validateState(String email) {
  //   try {
  //     _contactService.validateState(email);
  //     _emailIsValid = true;
  //     return null;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
}
