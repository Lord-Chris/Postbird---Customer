import 'package:postbird/core/index.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key? key,
    required this.chat,
  }) : super(key: key);

  final ChatItem chat;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment:
          chat.isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          constraints: BoxConstraints(maxWidth: width * 0.75),
          decoration: BoxDecoration(
            color:
                chat.isSender ? AppColors.primaryColor : AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(chat.isSender ? 0 : 12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(chat.isSender ? 12 : 0),
            ),
          ),
          child: Column(
            crossAxisAlignment: chat.isSender
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                chat.message,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color:
                      chat.isSender ? AppColors.whiteColor : AppColors.darkGrey,
                ),
              ),
              SizedBox(height: 5),
              Text(
                DateFormat.Hm().format(chat.timestamp),
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: (chat.isSender
                          ? AppColors.whiteColor
                          : AppColors.darkGrey)
                      .withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
