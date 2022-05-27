import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/entities/reminder_entity.dart';

class Contact {
  int id;
  String name;
  String phone;
  String? email;
  String? urlImage;
  Address? address;
  Reminder? reminder;
  Contact(
      {required this.name,
      this.reminder,
      this.address,
      required this.phone,
      this.email,
      this.urlImage,
      required this.id});
}
