import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationNavigatorBarItemView extends GetView {
  const NotificationNavigatorBarItemView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:20.0),
              child: Text(
                'Lembretes',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, snapshot) {
                    return const ListTile(
                      title: Text(
                        '5:00am',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('ter,jun'),
                      leading:
                          CircleAvatar(backgroundColor: Colors.blue, radius: 30),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
