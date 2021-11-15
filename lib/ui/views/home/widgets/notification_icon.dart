import 'package:postbird/core/index.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
    required this.onPressed,
    required this.list,
  }) : super(key: key);

  // final String id;
  final void Function()? onPressed;
  final List<NotificationItem> list;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.notifications_none),
          color: AppColors.whiteColor,
          onPressed: onPressed,
          padding: EdgeInsets.all(5),
        ),
        Visibility(
          visible: list.any((element) => element.hasBeenSeen == false),
          replacement: Container(),
          child: Positioned(
            top: 14,
            right: 14,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 4.5,
            ),
          ),
        )
      ],
    );
  }
}
