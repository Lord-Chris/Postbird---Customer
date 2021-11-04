import 'package:postbird/core/index.dart';

class NotificationItem {
  final int id;
  final NotificationCategory category;
  final String userId, title, message;

  NotificationItem({
    required this.id,
    required this.userId,
    required this.category,
    required this.title,
    required this.message,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      message: json['message'],
      category: parseCategory(json['category']),
    );
  }
  static dynamic parseCategory(dynamic data) {
    if (data is String) {
      switch (data) {
        case "order":
          return NotificationCategory.Order;
        case "personal":
          return NotificationCategory.Personal;
        default:
          return NotificationCategory.Personal;
      }
    }
    if (data is NotificationCategory) {
      switch (data) {
        case NotificationCategory.Order:
          return "order";
        case NotificationCategory.Personal:
          return "personal";
      }
    }
  }
}