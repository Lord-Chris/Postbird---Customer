import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:postbird/core/index.dart';
import '../controllers/select_location_controller.dart';

class MapDatePicker extends StatelessWidget {
  MapDatePicker({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<SelectLocationController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      width: width * 0.8,
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Flexible(
            child: CupertinoDatePicker(
              onDateTimeChanged: (val) {
                controller.date = val;
                controller.dateController.text =
                    DateFormat('EEE, dd MMM yyyy').format(val);
              },
              backgroundColor: AppColors.whiteColor,
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              label: 'Continue',
              onTap: () {
                controller.date = controller.date ?? DateTime.now();
                controller.dateController.text =
                    DateFormat('EEE, dd MMM yyyy').format(controller.date!);
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}
