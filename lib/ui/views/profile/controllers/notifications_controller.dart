import 'package:postbird/core/index.dart';

class NotificationsController extends BaseController {
  final _notificationRepo = NotificationRepository();
  final scrollCont = ScrollController();

  Stream<List> streamNotifications() => _notificationRepo.streamNotifications();

  Future<List<NotificationItem>> fetchNotifications() =>
      _notificationRepo.fetchNotifications();
}
