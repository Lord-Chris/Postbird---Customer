import 'package:postbird/core/index.dart';

class ChatItem {
  final String message;
  final int senderId,receiverId;
  final String senderName, senderPhoto;
  final String  receiverName, receiverPhoto;
  bool isSender, hasRead;
  final DateTime timestamp;

  ChatItem({
    required this.senderId,
    required this.senderName,
    required this.senderPhoto,
    required this.receiverId,
    required this.receiverName,
    required this.receiverPhoto,
    required this.message,
    required this.isSender,
    required this.timestamp,
    this.hasRead = true,
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) {
    return ChatItem(
      senderId: json['senderId'],
      senderName: json['senderName'],
      senderPhoto: json['senderPhoto'],
      receiverId: json['receiverId'],
      receiverName: json['receiverName'],
      receiverPhoto: json['receiverPhoto'],
      message: json['message'],
      isSender: json['isSender'],
      hasRead: json['hasRead'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "senderId": senderId,
        "senderName": senderName,
        "senderPhoto": senderPhoto,
        "receiverId": receiverId,
        "receiverName": receiverName,
        "receiverPhoto": receiverPhoto,
        "isSender": isSender,
        "hasRead": hasRead,
        "timestamp": timestamp.millisecondsSinceEpoch,
      };
}
