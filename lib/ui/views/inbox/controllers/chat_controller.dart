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
      message: textController.text.trim(),
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

  // Future<void> sendOtherMessage() async {
  //   if (textController.text.isEmpty) return;
  //   final chat = ChatItem(
  //     message: textController.text.trim(),
  //     isSender: true,
  //     timestamp: DateTime.now(),
  //     senderId: 100,
  //     senderName: 'Developer Chris',
  //     senderPhoto: 'https://api.postbird.com.ng/public/img/profile/default.png',
  //     receiverId: user.id!,
  //     receiverName: user.fullName,
  //     receiverPhoto: user.profilePic!,
  //   );
  //   await _inboxRepo.sendChat(chat);
  //   textController.clear();
  // }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
