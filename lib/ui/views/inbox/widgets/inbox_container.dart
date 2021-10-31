import 'package:postbird/core/index.dart';
import '../views/chat_view.dart';

class InboxContainer extends StatelessWidget {
  const InboxContainer({
    Key? key,
    required this.inbox,
  }) : super(key: key);
  final InboxItem inbox;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ChatView(chatinfo: inbox)),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              height: 100,
              width: 20,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(
                  Icons.delete_outline,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
        child: Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  DateFormat.Hm().format(inbox.timeStamp!),
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(inbox.photoUrl),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inbox.name,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      1 == 0.01 //conversations[item.key]['unr'] == 1
                          ? Text(
                              "conversations[item.key]['msg'] +[un read]",
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(
                                  0xFF0AC917,
                                ),
                              ),
                            )
                          : Text(
                              "${inbox.lastMessage}",
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(
                                  0xFF464646,
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
