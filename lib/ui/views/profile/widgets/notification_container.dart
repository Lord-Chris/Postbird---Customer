import 'package:postbird/core/index.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(notification.hasBeenSeen);
    return Container(
      color:
          notification.hasBeenSeen ? AppColors.whiteColor : Color(0xFFFAF7F2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notification.title,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: AppColors.blackColor,
                ),
              ),
              Visibility(
                visible: !notification.hasBeenSeen,
                child: Text(
                  'New',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            notification.message,
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
