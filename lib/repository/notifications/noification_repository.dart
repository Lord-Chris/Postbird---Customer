import 'package:firebase_database/firebase_database.dart';
import 'package:postbird/core/index.dart';

class NotificationRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  // @override
  Stream<List> streamNotifications() {
    return notificationsPath.onChildAdded.transform(notificationTransformer());
  }

  Future<List<NotificationItem>> fetchNotifications() async {
    try {
      final _headers = {"Authorization": "Bearer $token"};
      var res = await _networkService.get(ApiStrings.notificationDetails,
          headers: _headers);
      return (res!.data['notifications'] as List)
          .map((e) => NotificationItem.fromJson(e))
          .toList();
    } catch (e) {
      throw Failure(e.toString());
    }
  }

  DatabaseReference get notificationsPath =>
      _database.reference().child("drivers/notifications");

  StreamTransformer<Event, List> notificationTransformer() {
    return StreamTransformer.fromHandlers(
      handleData: (data, sink) {
        final _headers = {"Authorization": "Bearer $token"};
        final List list = [];
        final _data = data.snapshot.value as List<Map>;
        print(_data);
        _data.removeWhere((element) => element['user_id'] != user.id);
        _data.forEach((notifcs) async {
          var res = await _networkService.post(
            "${ApiStrings.notificationDetails}${notifcs['event_id']}",
            headers: _headers,
          );
          list.add(res);

          sink.add(list);
        });
      },
    );
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
  String? get token => _storageService.getString(StorageKeys.authToken);
}
