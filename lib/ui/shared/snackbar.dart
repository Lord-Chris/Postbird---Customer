import 'package:postbird/core/index.dart';

class MySnackBar {
  static success(String message) {
    return Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.whiteColor,
      backgroundColor: Colors.green,
    );
  }

  static failure(String message) {
    return Get.snackbar(
      'Failure',
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.whiteColor,
      backgroundColor: Colors.red,
    );
  }
}
