import 'package:postbird/core/index.dart';

class InboxController extends BaseController {
  final _inboxRepo = Get.find<IInboxRepository>();
  Stream<List<InboxItem>> streamInbox() => _inboxRepo.streamInbox();
}
