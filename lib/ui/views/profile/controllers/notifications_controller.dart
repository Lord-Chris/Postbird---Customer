import 'package:postbird/core/index.dart';

class NotificationsController extends BaseController {
  final _notificationRepo = NotificationRepository();

  Stream<List> streamNotifications() => _notificationRepo.streamNotifications();

  Future<List> fetchNotifications() => _notificationRepo.fetchNotifications();
}
