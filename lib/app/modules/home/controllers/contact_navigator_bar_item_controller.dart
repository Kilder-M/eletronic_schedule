import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/services/address_service.dart';
import 'package:eletronic_schedule/app/domain/services/contact_service.dart';
import 'package:get/get.dart';

class ContactNavigatorBarItemController extends GetxController {
  var limit = 15.obs;
  var offset = 0.obs;
  final _contactService = ContactService();
  final _addressService = AddressService();
  var contactList = <Contact>[].obs;

  ContactNavigatorBarItemController() {
    getContactList();
  }

  Future<List<Contact>> getContactList() async {
    return contactList.value =
        await _contactService.getList(limit: limit.value, offset: offset.value);
  }

  remove(Contact contact) async {
    if (contact.addressId != null) {
      await _addressService.remove(contact.addressId!);
    }
    await _contactService.remove(contact);
    await getContactList();
  }

  updatePagination() async {
    offset.value = offset.value + limit.value;
    contactList.addAll(await _contactService.getList(
        limit: limit.value, offset: offset.value));
  }
}
