import 'package:eletronic_schedule/app/modules/home/controllers/notification_navigator_bar_item_controller.dart';
import 'package:eletronic_schedule/app/modules/home/views/home_view.dart';
import 'package:eletronic_schedule/app/utils/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/notification_form_controller.dart';

class NotificationFormView extends GetView<NotificationFormController> {
  const NotificationFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(NotificationFormController());
    var _notificationNavigatorBarItemController =
        Get.put(NotificationNavigatorBarItemController());
    final form = GlobalKey<FormState>();
    final textEditingControllerTitle = TextEditingController();
    final textEditingControllerDetails = TextEditingController();
    final textEditingControllerTime = TextEditingController().obs;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.save),
        onPressed: () async {
          form.currentState!.validate();
          form.currentState!.save();
          if (_controller.isValid) {
            var customNotificationResult = await _controller.save();
            _controller.customNotificationUtil.showNotification(
              customNotification: customNotificationResult,
              duration: Duration(
                seconds: _controller.notificationTimeInseconds,
              ),
            );
            Get.offAll(const HomeView(initialIndex: 1,));
            _notificationNavigatorBarItemController.getList();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text('Lembrete criado! '),
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
                      'Novo Lembrete',
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
                            Builder(builder: (textTimeFormFieldContext) {
                              return TextFormFieldWidget(
                                labelText: 'Hora',
                                keyboardType: TextInputType.none,
                                onTap: () async {
                                  var timeResult = await showTimePicker(
                                    context: textTimeFormFieldContext,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  textEditingControllerTime.value.text =
                                      timeResult?.format(
                                              textTimeFormFieldContext) ??
                                          '';
                                  print(_controller
                                      .getSecondsNotification(timeResult));
                                  _controller
                                      .getSecondsNotification(timeResult);
                                },
                                prefixIcon: const Icon(Icons.timer_outlined),
                                validator: _controller.validateTime,
                                controller: textEditingControllerTime.value,
                                onSaved: (text) {
                                  _controller.customNotification.time =
                                      text ?? '';
                                },
                              );
                            }),
                            TextFormFieldWidget(
                              labelText: 'Título',
                              controller: textEditingControllerTitle,
                              validator: _controller.validateTitle,
                              onSaved: (text) {
                                _controller.customNotification.title =
                                    text ?? '';
                              },
                            ),
                            TextFormFieldWidget(
                              labelText: 'Descrição',
                              controller: textEditingControllerDetails,
                              onSaved: (text) {
                                _controller.customNotification.body =
                                    text ?? '';
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
