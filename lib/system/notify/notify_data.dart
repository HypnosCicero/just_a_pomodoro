
class NotifyData {
  late int id;
  String? title;
  String? body;
  String? payload;
  NotifyData(int id, String title, String body, String payload) {
      this.id = id;
      this.title = title;
      this.body = body;
      this.payload = payload;
  }
}
class NotifyDataFactory {
  static List<NotifyData> createNotifyData() {
    return [
      //index = 0 => 25 % 3 - 1 =0
      NotifyData(0, "WORK", "It's time to work", "work payload"),
      //index = 1 => 5 % 3 - 1 = 1
      NotifyData(1, "REST", "It's time to rest", "rest payload"),
    ];
  }
}