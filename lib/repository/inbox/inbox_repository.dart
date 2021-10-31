import 'package:postbird/core/index.dart';

class InboxRepository extends IInboxRepository {
  final _storageService = Get.find<IStorageService>();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<InboxItem>> streamInbox() {
    final collect = inboxCollection.doc("${user.id}").collection("chats");
    return collect.snapshots().transform(RepoUtils.inboxTransformer());
  }

  @override
  Stream<List<ChatItem>> streamChats(String recipientId) {
    final collect = inboxCollection.doc("${user.id}").collection("chats");
    return collect
        .snapshots()
        .transform(RepoUtils.chatTransformer(recipientId));
  }

  @override
  Future<void> sendChat(ChatItem chat) async {
    try {
      final sendColl = inboxCollection.doc("${user.id}").collection("chats");
      final recColl =
          inboxCollection.doc("${chat.receiverId}").collection("chats");
      // sender's collection
      String docId =
          "${chat.receiverId} ${chat.timestamp.millisecondsSinceEpoch}";
      await sendColl.doc(docId).set(chat.toJson());
      //receiver's collection
      docId = "${chat.senderId} ${chat.timestamp.millisecondsSinceEpoch}";
      final _chat = chat
        ..isSender = false
        ..hasRead = false;
      await recColl.doc(docId).set(_chat.toJson());
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  // @override
  // Future<void> sendChat(ChatItem chat) async {
  //   try {
  //     final sendColl =
  //         inboxCollection.doc("${chat.senderId}").collection("chats");
  //     final recColl =
  //         inboxCollection.doc("${chat.receiverId}").collection("chats");
  //     // sender's collection
  //     String docId =
  //         "${chat.receiverId} ${chat.timestamp.millisecondsSinceEpoch}";
  //     await sendColl.doc(docId).set(chat.toJson());
  //     // receiver's collection
  //     docId = "${chat.senderId} ${chat.timestamp.millisecondsSinceEpoch}";
  //     final _chat = chat
  //       ..isSender = false
  //       ..hasRead = false;
  //     await recColl.doc(docId).set(_chat.toJson());
  //   } on Failure catch (e) {
  //     throw e;
  //   } catch (e) {
  //     print(e.toString());
  //     throw Failure(e.toString());
  //   }
  // }

  get inboxCollection => _firestore.collection("inboxes");
  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
