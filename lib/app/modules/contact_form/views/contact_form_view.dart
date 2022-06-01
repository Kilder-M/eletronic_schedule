import 'package:eletronic_schedule/app/utils/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_form_controller.dart';

class ContactFormView extends GetView<ContactFormController> {
  const ContactFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingControllerName = TextEditingController();
    final textEditingControllerPhone = TextEditingController();
    final textEditingControllerEmail = TextEditingController();
    final textEditingControllerCity = TextEditingController();
    final textEditingControllerState = TextEditingController();
    final textEditingControllerStreetAddress = TextEditingController();
    final textEditingControllerStreetAddresNumber = TextEditingController();
    final textEditingControllerZipCode = TextEditingController();
    final textEditingControllerComplement = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        size: 28,
                      ),
                    ),
                    const Text(
                      'Novo Contato',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, -2),
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,50,20,0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          TextFormFieldWidget(
                              labelText: 'Nome', controller: textEditingControllerName),
                          TextFormFieldWidget(
                              labelText: 'Telefone', controller: textEditingControllerPhone),
                          TextFormFieldWidget(
                              labelText: 'Email', controller: textEditingControllerEmail),
                          TextFormFieldWidget(
                              labelText: 'Cidade', controller: textEditingControllerCity),
                          TextFormFieldWidget(
                              labelText: 'Estado', controller: textEditingControllerState),
                          TextFormFieldWidget(
                              labelText: 'Endereço', controller: textEditingControllerStreetAddress),
                              TextFormFieldWidget(
                              labelText: 'Número', controller: textEditingControllerStreetAddresNumber),
                          TextFormFieldWidget(
                              labelText: 'CEP', controller: textEditingControllerZipCode),
                          TextFormFieldWidget(
                              labelText: 'Complemento', controller: textEditingControllerComplement),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
