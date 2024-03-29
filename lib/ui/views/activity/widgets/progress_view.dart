import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import 'package:postbird/ui/views/activity/views/package_detail_view.dart';
import 'package:postbird/ui/views/home/views/select_location.dart';
import '../controllers/activity_controller.dart';

class InProgressActivityTwo extends StatelessWidget {
  final controller = Get.find<ActivityController>();
  Widget build(BuildContext context) {
    final activities = controller.activities
        .where((e) => e.packageStatus != PackageStatus.delivered);
    return RefreshIndicator(
      onRefresh: () => controller.fetchActivities(),
      child: Visibility(
        visible: activities.isNotEmpty,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: activities.length,
          itemBuilder: (__, index) {
            final activity = controller.activities[index];
            return InkWell(
              onTap: () {
                if (activity.packageStatus == PackageStatus.notAssigined)
                  Get.to(() => SelectLocation(package: activity));
                else
                  Get.to(() => PackageDetailView(package: activity));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.whiteishColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'In Progress',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          activity.packageName,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '|',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: AppColors.blackColor.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          activity.receiver.phone,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.blackColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      activity.destination.address!,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.blackColor.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        replacement: Center(
          child: Text('No activities in progress'),
        ),
      ),
    );
  }
}
