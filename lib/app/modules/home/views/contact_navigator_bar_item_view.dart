import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/modules/contact_form/views/contact_form_view.dart';
import 'package:eletronic_schedule/app/modules/home/controllers/contact_navigator_bar_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactNavigatorBarItemView
    extends GetView<ContactNavigatorBarItemController> {
  const ContactNavigatorBarItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const ContactFormView());
          },
          backgroundColor: Colors.pink,
          child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Obx(()=>
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Contatos',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: controller.contactList.value,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      var contactList = snapshot.data as List<Contact>;
                      return contactList.isNotEmpty
                          ? ListView.builder(
                              itemCount: contactList.length,
                              itemBuilder: (context, index) {
                                var contact = contactList[index];
                                return ListTile(
                                  trailing: Text(contact.addressId.toString()),
                                  title: Text(
                                    contact.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(contact.phone),
                                  leading: const CircleAvatar(
                                      backgroundColor: Colors.blue, radius: 30),
                                );
                              },
                            )
                          : const Center(
                              child: Text('Não há contatos salvo.'),
                            );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
