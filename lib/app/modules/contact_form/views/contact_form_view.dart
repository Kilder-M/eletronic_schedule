import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/modules/home/controllers/contact_navigator_bar_item_controller.dart';
import 'package:eletronic_schedule/app/modules/home/views/home_view.dart';
import 'package:eletronic_schedule/app/utils/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../controllers/contact_form_controller.dart';

class ContactFormView extends GetView<ContactFormController> {
  const ContactFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ContactFormController());

    final textEditingControllerName =
        TextEditingController(text: _controller.contact.name).obs;
    final textEditingControllerPhone =
        TextEditingController(text: _controller.contact.phone).obs;
    final textEditingControllerEmail =
        TextEditingController(text: _controller.contact.email).obs;
    final textEditingControllerCity =
        TextEditingController(text: _controller.address.city).obs;
    final textEditingControllerState =
        TextEditingController(text: _controller.address.state).obs;
    final textEditingControllerStreetAddress =
        TextEditingController(text: _controller.address.streetAddress).obs;
    final textEditingControllerStreetAddresNumber =
        TextEditingController(text: _controller.address.streetAddressNumber)
            .obs;
    final textEditingControllerZipCode =
        TextEditingController(text: _controller.address.zipCode).obs;
    final textEditingControllerComplement =
        TextEditingController(text: _controller.address.complement).obs;
    final form = GlobalKey<FormState>();
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    var _contactNavigatorBarItemController =
        Get.put(ContactNavigatorBarItemController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.save),
        onPressed: () async {
          form.currentState!.validate();
          form.currentState!.save();
          if (_controller.isValid) {
            if (_controller.address.city != null) {
              Address addressResponse =
                  await _controller.saveAddress(_controller.address);
              _controller.contact.addressId = addressResponse.id;
              await _controller.saveContact(_controller.contact);
            }
            Get.offAll(const HomeView());
            _contactNavigatorBarItemController.getContactList();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  _controller.contact.id == null
                      ? 'Contato criado! '
                      : 'Contato atualizado!',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
      ),
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
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: form,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormFieldWidget(
                              labelText: 'Nome',
                              controller: textEditingControllerName.value,
                              validator: _controller.validateName,
                              onSaved: (text) {
                                _controller.contact.name = text ?? '';
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Telefone',
                              controller: textEditingControllerPhone.value,
                              validator: _controller.validatePhone,
                              keyboardType: TextInputType.phone,
                              inputFormatter: [mask],
                              onSaved: (text) {
                                _controller.contact.phone = text ?? '';
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Email',
                              controller: textEditingControllerEmail.value,
                              onSaved: (text) {
                                _controller.contact.email = text;
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Cidade',
                              controller: textEditingControllerCity.value,
                              onSaved: (text) {
                                _controller.address.city = text;
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Estado',
                              controller: textEditingControllerState.value,
                              onSaved: (text) {
                                _controller.address.state = text;
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Endereço',
                              controller:
                                  textEditingControllerStreetAddress.value,
                              onSaved: (text) {
                                _controller.address.streetAddress = text;
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Número',
                              controller:
                                  textEditingControllerStreetAddresNumber.value,
                              onSaved: (text) {
                                _controller.address.streetAddressNumber = text;
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'CEP',
                              controller: textEditingControllerZipCode.value,
                              onSaved: (text) {
                                _controller.address.zipCode = text;
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Complemento',
                              controller: textEditingControllerComplement.value,
                              onSaved: (text) {
                                _controller.address.complement = text;
                              },
                            ),
                          ],
                        ),
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
