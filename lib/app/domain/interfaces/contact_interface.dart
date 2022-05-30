import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';

abstract class ContactInterface{
    Future<List<Contact>> getList();
    save(Contact contact);
    remove(Contact contact);
}