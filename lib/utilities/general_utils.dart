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
}
