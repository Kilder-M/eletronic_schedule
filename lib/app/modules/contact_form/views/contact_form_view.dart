import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_form_controller.dart';

class ContactFormView extends GetView<ContactFormController> {
  const ContactFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContactFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
