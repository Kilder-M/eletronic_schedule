import 'package:eletronic_schedule/app/modules/home/views/contact_navigator_bar_item_view.dart';
import 'package:eletronic_schedule/app/modules/home/views/notification_navigator_bar_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.pink,
            child: const Icon(Icons.add)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedindex.value,
          selectedItemColor: Colors.black,
          elevation: 0,
          onTap: controller.onTapBottomBarIcon,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined
                    // color: ,
                    ),
                label: 'Contatos',
                tooltip: 'Sua lista de contatos'),
            BottomNavigationBarItem(
              tooltip: 'Seus Lembretes',
              icon: Icon(
                Icons.notifications_none_outlined,
              ),
              label: 'Lembretes',
            ),
          ],
        ),
        body: Center(
          child: widgetOptions().elementAt(controller.selectedindex.value),
        ),
      ),
    );
  }
}

List<Widget> widgetOptions() {
  return <Widget>[
    const ContactNavigatorBarItemView(),
    NotificationNavigatorBarItemView(),
  ];
}
