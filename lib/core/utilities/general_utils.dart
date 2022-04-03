import 'package:postbird/core/index.dart';

class GenUtils {
  static String packSizeIntToString(int val) {
    switch (val) {
      case 0:
        return 'small';
      case 1:
        return 'medium';
      case 2:
        return 'heavy';
      default:
        return 'heavy';
    }
  }

  static String packageStatusToString(PackageStatus status) {
    switch (status) {
      case PackageStatus.notAssigined:
        return '1';

      case PackageStatus.delivering:
        return '2';
      case PackageStatus.delivered:
        return '3';
    }
  }

  static PackageStatus stringToPackageStatus(String value) {
    switch (value) {
      case '1':
        return PackageStatus.notAssigined;
      case '2':
        return PackageStatus.delivering;
      case '3':
        return PackageStatus.delivered;
      default:
        return PackageStatus.notAssigined;
    }
  }
}
