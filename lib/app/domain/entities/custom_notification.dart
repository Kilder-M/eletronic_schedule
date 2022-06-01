class CustomNotification {
  int? id;
  String? title;
  String? body;
  String? payload;

  CustomNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.payload});


      factory CustomNotification.fromMap(Map<String, dynamic> sql) => CustomNotification(
        id: sql['id'],
        title: sql["title"],
        body: sql["body"],
        payload: sql["payload"],
      );
}
