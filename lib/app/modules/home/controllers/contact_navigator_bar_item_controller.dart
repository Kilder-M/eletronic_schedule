import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/services/contact_service.dart';
import 'package:get/get.dart';

class ContactNavigatorBarItemController extends GetxController {
  final _contactService = ContactService();
   var contactList = Future.value(<Contact>[]).obs;

  ContactNavigatorBarItemController() {
    getContactList();
  }

  Future<List<Contact>>getContactList() {
    return contactList.value = _contactService.getList();
  }
}
