import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/services/address_service.dart';
import 'package:eletronic_schedule/app/domain/services/contact_service.dart';
import 'package:get/get.dart';

class ContactNavigatorBarItemController extends GetxController {
  final _contactService = ContactService();
  final _addressService = AddressService();
  var contactList = Future.value(<Contact>[]).obs;

  ContactNavigatorBarItemController() {
    getContactList();
  }

  Future<List<Contact>> getContactList() {
    return contactList.value = _contactService.getList();
  }

  remove(Contact contact) async {
    if (contact.addressId != null) {
      await _addressService.remove(contact.addressId!);
    }
    await _contactService.remove(contact);
    await getContactList();
  }
}
