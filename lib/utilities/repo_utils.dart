import 'package:firebase_database/firebase_database.dart';
import 'package:postbird/core/index.dart';

class RepoUtils {
  static StreamTransformer<Event, bool> packageTransformer(String id) {
    return StreamTransformer<Event, bool>.fromHandlers(
        handleData: (data, sink) {
      final exists = !data.snapshot.exists;
      print(exists);

      // _data.removeWhere((key, value) => value['package_id'] != id);
      // final exists = _data.isNotEmpty;
      // print(exists);
      // // .map((e) => e).contains(id);
      // print(exists);
      sink.add(exists);
    });
  }

  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<InboxItem>>
      inboxTransformer() {
    return StreamTransformer.fromHandlers(handleData: (data, sink) {
      final inboxList = <InboxItem>[];

      data.docs.forEach((element) {
        List ids = inboxList.map((e) => e.messageId).toList();
        if (ids.contains(element.id)) {
          inboxList.removeWhere((el) => el.messageId == element.id);
        }
        inboxList.add(
          InboxItem(
            userId: element.data()['receiverId'],
            messageId: element.id,
            name: element.data()['receiverName'],
            photoUrl: element.data()['receiverPhoto'],
            lastMessage: element.data()['message'],
            unreadCount: element.data()['hasRead'],
            timeStamp: element.data()['timestamp'],
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
