class InboxItem {
  final int userId;
  final String messageId;
  String name, photoUrl;
  String? lastMessage;
  int? unreadCount;
  DateTime? timeStamp;

  InboxItem({
    required this.userId,
    required this.messageId,
    required this.name,
    required this.photoUrl,
    this.timeStamp,
    this.lastMessage,
    this.unreadCount,
  });

  // factory InboxItem.fromJson(Map<String, dynamic> json) {
  //   return InboxItem(
  //     userId: json['user_id'],
  //     messageId: json["message_id"],
  //     name: json["name"],
  //     photoUrl: json["photo_url"],
  //     lastMessage: json["last_message"],
  //     unreadCount: json["unread_count"],
  //     timeStamp: json['timestamp'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       'user_id': userId,
  //       "message_id": messageId,
  //       "name": name,
  //       "photo_url": photoUrl,
  //       "last_message": lastMessage,
  //       "unread_count": unreadCount,
  //     };
}
