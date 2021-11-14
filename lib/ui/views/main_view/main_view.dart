import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/activity/views/activity_view.dart';
import 'package:postbird/ui/views/home/views/home_view.dart';
import 'package:postbird/ui/views/inbox/views/inbox_view.dart';
import 'package:postbird/ui/views/profile/views/profile_view.dart';
import 'main_controller.dart';

class MainView extends StatelessWidget {
  MainView({Key? key}) : super(key: key);

  final List<Widget> _children = [
    HomeView(),
    ActivityView(),
    InboxView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          body: _children[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.onTappedBar,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.orangeAccent,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Activity',
                icon: Icon(
                  Icons.all_inbox,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Chat',
                icon: Icon(
                  Icons.message_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Me',
                icon: Icon(
                  Icons.person_outlined,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
