import 'package:postbird/core/index.dart';
import '../controllers/inbox_controller.dart';
import '../widgets/inbox_container.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<InboxController>(
      init: InboxController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      'Inbox',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: StreamBuilder<List<InboxItem>>(
                      stream: controller.streamInbox(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if ((snapshot.data == null || snapshot.data!.isEmpty)) {
                          return Center(
                            child: Text(
                              "No available chats. Create a package to chat",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 1,
                          itemBuilder: (__, index) {
                            InboxItem? inbox = snapshot.data?[index];
                            //     InboxItem(
                            //   userId: 100,
                            //   messageId: 'This on that',
                            //   name: 'Developer Chris',
                            //   photoUrl:
                            //       'https://api.postbird.com.ng/public/img/profile/default.png',
                            //   lastMessage: "200 things are coming",
                            //   timeStamp: DateTime.now(),
                            // );
                            // assert(inbox!.userId != 30);
                            return InboxContainer(inbox: inbox!);
                          },
                        );
                      },
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
