import 'package:postbird/Screens/model/place_model.dart';
import 'package:postbird/core/index.dart';

class CreatePackageController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final PlaceDetail origin;
  final PlaceDetail destination;
  final DateTime date;
  final pageController = PageController();
  final recipientName = TextEditingController();
  final recipientPhone = TextEditingController();
  final notes = TextEditingController();
  final formKey = GlobalKey<FormState>();

  int pageIndex = 0;
  var name;
  var address;
  int? currentIndex;
  bool checkBoxValue = false;

  CreatePackageController(this.origin, this.destination, this.date);

  void updatePackageSize(int index) {
    currentIndex = index;
    update();
  }

  void togglerCheckValue(bool? val) {
    checkBoxValue = val!;
    update();
  }

  void onPageChanged(int value) {
    if (value > pageIndex)
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    else
      pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    pageIndex = value;
    update();
  }

  void back() {
    if (pageIndex > 0) {
      onPageChanged(pageIndex - 1);
    } else {
      Get.back();
    }
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
