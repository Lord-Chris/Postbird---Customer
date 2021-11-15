import 'package:postbird/core/index.dart';

class NotificationsController extends BaseController {
  final _notificationRepo = Get.find<INotificationRepository>();
  final scrollCont = ScrollController();

  Stream<List> streamNotifications() => _notificationRepo.streamNotifications();

  Future<List<NotificationItem>> fetchNotifications() async {
    final notifications = await _notificationRepo.fetchNotifications();
    final notification = await _notificationRepo.checkForAppUpdate();
    if (notification != null) notifications.add(notification);
    return notifications;
  }

  void readNotifications() => _notificationRepo.readNotifications();
  @override
  void onClose() {
    readNotifications();
    super.onClose();
  }
}
