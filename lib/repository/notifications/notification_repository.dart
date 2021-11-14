import 'package:firebase_database/firebase_database.dart';
import 'package:postbird/core/index.dart';

class NotificationRepository extends INotificationRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final _newVersion = NewVersion();

  String? _storeUrl;

  @override
  Stream<List> streamNotifications() {
    return notificationsPath.onChildAdded.transform(notificationTransformer());
  }

  @override
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

  @override
  Future<NotificationItem?> checkForAppUpdate() async {
    final status = await _newVersion.getVersionStatus();
    bool canUpdate = status?.canUpdate ?? false;
    print(status?.storeVersion);
    if (canUpdate) {
      _storeUrl = status?.appStoreLink;
      return NotificationItem(
        id: 100,
        userId: user.id.toString(),
        category: NotificationCategory.Personal,
        title: "Update Announcement",
        message: "PostBird Version ${status?.storeVersion}",
        details:
            "Dear ${user.username}, We have brought an update that will make PostBird better for you. Here is the update summary:\n\n${status?.releaseNotes}",
      );
    }
  }

  DatabaseReference get notificationsPath =>
      _database.reference().child("drivers/notifications");
  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
  String? get token => _storageService.getString(StorageKeys.authToken);
  @override
  String? get storeUrl => _storeUrl;
}
