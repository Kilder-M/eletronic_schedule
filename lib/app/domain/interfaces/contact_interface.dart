import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';

abstract class ContactInterface{
    Future<List<Contact>> getList();
    Future<List<Contact>> getListByName(String name);
    Future<List<Contact>> getListByPhone(String phone);
    save(Contact contact);
    remove(Contact contact);
}