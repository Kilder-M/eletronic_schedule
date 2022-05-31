import 'package:eletronic_schedule/app/domain/entities/reminder_entity.dart';

class Contact {
  int? id;
  int? addressId;
  int? notificationId;
  String name;
  String phone;
  String? email;
  String? imageUrl;
  Reminder? reminder;
  Contact(
      {required this.name,
      this.reminder,
      this.notificationId,
      this.addressId,
      required this.phone,
      this.email,
      this.imageUrl,
      this.id});

  factory Contact.fromMap(Map<String, dynamic> sql) => Contact(
        id: sql['id'],
        name: sql["name"],
        phone: sql["phone"],
        email: sql["email"],
        imageUrl: sql["image_Url"],
        addressId: sql["address_id"],
        notificationId: sql["notification_id"],
      );
}
