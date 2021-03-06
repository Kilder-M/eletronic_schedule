import 'package:eletronic_schedule/app/domain/entities/custom_notification.dart';
import 'package:eletronic_schedule/app/modules/home/controllers/notification_navigator_bar_item_controller.dart';
import 'package:eletronic_schedule/app/modules/notification_form/views/notification_form_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationNavigatorBarItemView
    extends GetView<NotificationNavigatorBarItemController> {
  const NotificationNavigatorBarItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(NotificationNavigatorBarItemController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              const NotificationFormView(),
            );
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
                  'Lembretes',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<CustomNotification>>(
                  future: _controller.customNotificationList.value,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      List<CustomNotification> customNotificationList =
                          snapshot.data!.obs;
                      return customNotificationList.isNotEmpty
                          ? ListView.builder(
                              itemCount: customNotificationList.length,
                              itemBuilder: (context, index) {
                                var customNotification =
                                    customNotificationList[index];
                                return listTileWidget(
                                  time: customNotification.time,
                                  subtitle: customNotification.body,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        content: const Text(
                                          'Deseja excluir?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('NAO'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _controller
                                                  .remove(customNotification);
                                              Get.back();
                                            },
                                            child: const Text('SIM'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text('N??o h?? lembretes.'),
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

  Widget listTileWidget(
      {String? time, String? subtitle, required void Function() onTap}) {
    return Column(
      children: [
        ListTile(
          trailing:
              GestureDetector(onTap: onTap, child: const Icon(Icons.delete)),
          title: Text(
            '$time',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(subtitle ?? ''),
        ),
        Container(
          width: double.infinity,
          height: 0.5,
          color: Colors.grey,
        )
      ],
    );
  }
}
