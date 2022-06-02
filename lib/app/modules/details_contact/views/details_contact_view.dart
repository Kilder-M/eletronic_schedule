import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/modules/contact_form/views/contact_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/details_contact_controller.dart';

class DetailsContactView extends GetView<DetailsContactController> {
  const DetailsContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(DetailsContactController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, -2),
                    spreadRadius: 2,
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.chevron_left_rounded,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialogMethod(
                              context,
                              _controller.contactArgument,
                              _controller.address.value,
                            );
                          },
                          child: const Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                        backgroundColor: Colors.blue, radius: 60),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.contactArgument.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 8, 0),
              child: SizedBox(
                width: double.infinity,
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textsColumn(
                          title: 'Telefone',
                          field: _controller.contactArgument.phone),
                      textsColumn(
                          title: 'Email',
                          field: _controller.contactArgument.email),
                      textsColumn(
                          title: 'Estado',
                          field: _controller.address.value.state),
                      textsColumn(
                          title: 'Cidade',
                          field: _controller.address.value.city),
                      textsColumn(
                          title: 'Endereço',
                          field: _controller.address.value.streetAddress),
                      textsColumn(
                          title: 'Numero',
                          field: _controller.address.value.streetAddressNumber),
                      textsColumn(
                          title: 'CEP',
                          field: _controller.address.value.zipCode),
                      textsColumn(
                          title: 'Detalhes',
                          field: _controller.address.value.complement),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogMethod(BuildContext context, Contact contact, Address address) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('O que deseja fazer?'),
              actions: [
                TextButton(
                  onPressed: () => {
                    Get.to(const ContactFormView(),
                        arguments: [contact, address]),
                  },
                  child: const Text('Editar'),
                ),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Voltar'),
                ),
              ],
            ));
  }

  Widget textsColumn({required String title, String? field}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            field ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Container(width: double.infinity,color: Colors.grey,height: 0.5,),
          )
        ],
      ),
    );
  }
}
