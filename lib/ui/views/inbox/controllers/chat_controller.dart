import 'package:postbird/core/index.dart';

class ChatController extends BaseController {
  final InboxItem inboxInfo;
  ChatController(this.inboxInfo);

  final _inboxRepo = Get.find<IInboxRepository>();
   final _storageService = Get.find<IStorageService>();
 final textController = TextEditingController();

  Stream<List<ChatItem>> streamChats() =>
      _inboxRepo.streamChats(inboxInfo.userId.toString());

  Future<void> sendMessage() async {
    if (textController.text.isEmpty) return;
    final chat = ChatItem(
      message: textController.text,
      isSender: true,
      timestamp: DateTime.now(),
      senderId: user.id!,
      senderName: user.fullName,
      senderPhoto: user.profilePic!,
      receiverId: inboxInfo.userId,
      receiverName: inboxInfo.name,
      receiverPhoto: inboxInfo.photoUrl,
    );
    await _inboxRepo.sendChat(chat);
    textController.clear();
  }

    User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);

}
