import 'package:postbird/core/index.dart';

abstract class IInboxRepository {
  Stream<List<InboxItem>> streamInbox();
  Stream<List<ChatItem>> streamChats(String recipientId);
  Future<void> sendChat(ChatItem chat);
}
