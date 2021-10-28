import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postbird/core/index.dart';
import '../controllers/activity_controller.dart';
import '../views/package_detail_view.dart';

class CompleteActivity extends StatelessWidget {
  final controller = Get.find<ActivityController>();

  Widget build(BuildContext context) {
    final activities = controller.activities.where((e) => e.isComplete!);
    return RefreshIndicator(
      onRefresh: () => controller.fetchActivities(),
      child: Visibility(
        visible: activities.isNotEmpty,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: activities.length,
          itemBuilder: (__, index) {
            final activity = controller.activities[index];
            return InkWell(
              onTap: ()=> Get.to(()=> PackageDetailView(package: activity)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteishColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        activity.date,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.blackColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Received',
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.blackColor,
                              ),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.check,
                              color: Colors.green[800],
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Express',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          activity.destination.address!,
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blackColor.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "${activity.note}",
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.blackColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        replacement: Center(
          child: Text('No completed activities'),
        ),
      ),
    );
  }
}
