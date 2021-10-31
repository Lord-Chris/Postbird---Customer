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
                        fontSize: 18,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    padding: EdgeInsets.only(top: 50),
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
                        if (!snapshot.data!.isEmpty) {
                          return Center(
                            child: Text(
                              "No available chats. Create a package to chat",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: 10, //snapshot.data?.length ?? 0,
                          itemBuilder: (__, index) {
                            InboxItem? inbox = InboxItem(
                                userId: 1,
                                messageId: '',
                                name: '',
                                photoUrl: '');
                            //snapshot.data?[index];
                            return InboxContainer(inbox: inbox);
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
