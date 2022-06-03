class CustomNotification {
  int? id;
  String? title;
  String? body;
  String? payload;
  String? time;

  CustomNotification(
      {this.id,
      required this.title,
      required this.time,
      this.body,
      this.payload = '/home'});

  factory CustomNotification.fromMap(Map<String, dynamic> sql) =>
      CustomNotification(
        id: sql['id'],
        title: sql["title"],
        body: sql["body"],
        payload: sql["payload"],
        time: sql['time'],
      );
}
