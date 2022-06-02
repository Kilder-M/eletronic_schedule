import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/details_contact_controller.dart';

class DetailsContactView extends GetView<DetailsContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailsContactView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailsContactView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
