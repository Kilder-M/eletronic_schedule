import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/modules/contact_form/views/contact_form_view.dart';
import 'package:eletronic_schedule/app/modules/details_contact/views/details_contact_view.dart';
import 'package:eletronic_schedule/app/modules/home/controllers/contact_navigator_bar_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactNavigatorBarItemView
    extends GetView<ContactNavigatorBarItemController> {
  const ContactNavigatorBarItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ContactNavigatorBarItemController());
    var scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        _controller.updatePagination();
      }
    });
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(

          onPressed: () {
            Get.to(const ContactFormView(),
                arguments: [Contact(name: '', phone: ''), Address()]);
          },
          backgroundColor: Colors.pink,
          child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
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
              child: FutureBuilder<List<Contact>>(
                future: _controller.getContactList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    // List<Contact> contactList = snapshot.data!.obs;
                    return _controller.contactList.isNotEmpty
                        ? Obx(
                            () => ListView.builder(
                              controller: scrollController,
                              itemCount: _controller.contactList.length,
                              itemBuilder: (context, index) {
                                var contact = _controller.contactList[index];
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(const DetailsContactView(),
                                        arguments: contact);
                                  },
                                  child: ListTile(
                                    trailing: GestureDetector(
                                      onTap: () {
                                        showDialogMethod(context, () {
                                          _controller.remove(contact);
                                          Get.back();
                                        });
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.more_horiz_outlined,
                                          ),
                                        ],
                                      ),
                                    ),
                                    title: Text(
                                      contact.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    subtitle: Text(contact.phone),
                                    leading: const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 30,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: Text('N??o h?? contatos.'),
                          );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogMethod(BuildContext context, void Function() onPressed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('O que deseja fazer?'),
        actions: [
          TextButton(
            onPressed: onPressed,
            child: const Text('Excluir'),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }
}
