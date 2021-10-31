import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import '../controllers/chat_controller.dart';
import '../widgets/chat_container.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key, required this.chatinfo}) : super(key: key);
  final InboxItem chatinfo;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(chatinfo),
      builder: (controller) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  height: 15,
                  width: width - 70,
                  decoration: BoxDecoration(
                    color: AppColors.whiteishColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(1000),
                      topLeft: Radius.circular(1000),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(
                        0xFFFAFAFA,
                      ),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                              Text(
                                'Chat',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 1.5),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 2,
                          color: AppColors.iconGrey,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          width: double.infinity,
                          // height: 70,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 17,
                                backgroundImage: NetworkImage(
                                  'https://api.postbird.com.ng/public/img/profile/default.png',
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Driver',
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: AppColors.blackColor
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    Text(
                                      "chatinfo.name",
                                      style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                'Today, 12 Sep 2020',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.iconGrey,
                        ),
                        Expanded(
                          child: StreamBuilder<List<ChatItem>>(
                            stream: controller.streamChats(),
                            builder: (context, snapshot) {
                              return ListView.separated(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                separatorBuilder: (__, i) =>
                                    SizedBox(height: 10),
                                itemBuilder: (__, index) {
                                  final chat = ChatItem(
                                      message: "message",
                                      isSender: !false,
                                      timestamp: DateTime.now(),
                                      hasRead: false,
                                      receiverId: 1,
                                      receiverName: '',
                                      receiverPhoto: '',
                                      senderId: 1,
                                      senderName: '',
                                      senderPhoto: '');
                                  return ChatContainer(chat: chat);
                                },
                              );
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  controller: controller.textController,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  minLines: null,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    hintText: 'Type a message',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    hintStyle: GoogleFonts.manrope(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          AppColors.blackColor.withOpacity(0.5),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => controller.sendMessage(),
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
