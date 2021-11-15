import 'package:postbird/core/index.dart';

abstract class INotificationRepository {
  Stream<List> streamNotifications();
  Future<List<NotificationItem>> fetchNotifications();
  Future<NotificationItem?> checkForAppUpdate();
  Future<void> readNotifications();

  String? get storeUrl;
  List<NotificationItem> get notifications;
}
