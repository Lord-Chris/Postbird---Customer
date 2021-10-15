import 'package:postbird/core/index.dart';

class BaseController extends GetxController {
  bool isBusy = false;

  setBusy(bool value) {
    isBusy = value;
    update();
  }
}
