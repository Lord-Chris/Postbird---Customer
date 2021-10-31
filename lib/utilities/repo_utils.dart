import 'package:firebase_database/firebase_database.dart';
import 'package:postbird/core/index.dart';

class RepoUtils {
  static StreamTransformer<Event, bool> packageTransformer(String id) {
    return StreamTransformer<Event, bool>.fromHandlers(
        handleData: (data, sink) {
      final exists = !data.snapshot.exists;
      sink.add(exists);
    });
  }

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<InboxItem>>
      inboxTransformer() {
    return StreamTransformer.fromHandlers(handleData: (data, sink) {
      final inboxList = <InboxItem>[];

      data.docs.forEach((element) {
        List ids = inboxList.map((e) => e.messageId.split(' ').first).toList();
        if (ids.contains(element.id.split(' ').first)) {
          inboxList.removeWhere((el) =>
              el.messageId.split(' ').first == element.id.split(' ').first);
        }
        print(inboxList);
        bool sender = element.data()['isSender'];
        inboxList.add(
          InboxItem(
            userId: element.data()[sender ? 'receiverId' : 'senderId'],
            messageId: element.id,
            name: element.data()[sender ? 'receiverName' : 'senderName'],
            photoUrl: element.data()[sender ? 'receiverPhoto' : "senderPhoto"],
            lastMessage: element.data()['message'],
            timeStamp: DateTime.fromMillisecondsSinceEpoch(
                element.data()['timestamp']),
          ),
        );
      });
      sink.add(inboxList);
    });
  }

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<ChatItem>>
      chatTransformer(String recipientId) {
    return StreamTransformer.fromHandlers(handleData: (data, sink) {
      data.docs.removeWhere((chat) => chat.id.split(" ").first != recipientId);
      final chatList =
          data.docs.map((e) => ChatItem.fromJson(e.data())).toList();
      chatList.sort((a, b) {
        DateTime first = a.timestamp;
        DateTime second = b.timestamp;
        return second.compareTo(first);
      });
      sink.add(chatList);
    });
  }
}
