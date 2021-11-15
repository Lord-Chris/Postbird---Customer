import 'package:firebase_database/firebase_database.dart';
import 'package:postbird/core/index.dart';

class NotificationRepository extends INotificationRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final _newVersion = NewVersion();

  List<NotificationItem> _notifications = [];

  String? _storeUrl;

  @override
  Stream<List> streamNotifications() {
    return notificationsPath.onChildAdded.transform(notificationTransformer());
  }

  @override
  Future<List<NotificationItem>> fetchNotifications() async {
    try {
      // network request and parsing
      final _headers = {"Authorization": "Bearer $token"};
      var res = await _networkService.get(ApiStrings.notificationDetails,
          headers: _headers);
      _notifications.clear();
      final notifications = (res!.data['notifications'] as List)
          .map((e) => NotificationItem.fromJson(e))
          .toList();

      // stored notifications retrival and parsing
      final stored = _storedStrings
          .map((e) => NotificationItem.fromJson(jsonDecode(e)))
          .toList();
      final storedIds = stored.map((e) => e.id).toList();

      // check if it has been seen
      for (NotificationItem data in notifications) {
        if (storedIds.contains(data.id)) {
          notifications.firstWhere((e) => e.id == data.id).hasBeenSeen = true;
        }
      }
      // save the new list
      final mapList = notifications.map((e) => jsonEncode(e.toMap())).toList();
      _storageService.saveStringList(StorageKeys.notifications, mapList);

      // return notifications
      _notifications.addAll(notifications);
      return notifications;
    } catch (e) {
      print(e.toString());
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
    // print(status?.storeVersion);
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

  @override
  Future<void> readNotifications() async {
    try {
      final stored = _storedStrings
          .map((e) => NotificationItem.fromJson(jsonDecode(e)))
          .toList();
      for (var data in stored) {
        data.hasBeenSeen = true;
      }
      // stored.removeAt(1);
      final mapList = stored.map((e) => jsonEncode(e.toMap())).toList();
      _storageService.saveStringList(StorageKeys.notifications, mapList);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  List<NotificationItem> get notifications => _notifications;

  @override
  String? get storeUrl => _storeUrl;

  DatabaseReference get notificationsPath =>
      _database.reference().child("drivers/notifications");
  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
  String? get token => _storageService.getString(StorageKeys.authToken);
  List<String> get _storedStrings =>
      _storageService.getStringList(StorageKeys.notifications) ?? [];
}
