import 'package:eletronic_schedule/app/modules/home/views/contact_navigator_bar_item_view.dart';
import 'package:eletronic_schedule/app/modules/home/views/notification_navigator_bar_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final int? initialIndex;
  const HomeView({Key? key, this.initialIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(HomeController());
    _controller.selectedindex.value =
        initialIndex ?? _controller.selectedindex.value;
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _controller.selectedindex.value,
          selectedItemColor: Colors.black,
          elevation: 0,
          onTap: controller.onTapBottomBarIcon,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
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
          child: widgetOptions().elementAt(_controller.selectedindex.value),
        ),
      ),
    );
  }
}

List<Widget> widgetOptions() {
  return <Widget>[
    const ContactNavigatorBarItemView(),
    const NotificationNavigatorBarItemView(),
  ];
}
