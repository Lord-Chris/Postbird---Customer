import 'package:postbird/Screens/model/place_model.dart';
import 'package:postbird/core/index.dart';

class CreatePackageController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final _activityRepo = Get.find<IActivityRepository>();
  final PlaceDetail origin;
  final PlaceDetail destination;
  final DateTime date;
  final pageController = PageController();
  final packageName = TextEditingController();
  final recipientName = TextEditingController();
  final recipientPhone = TextEditingController();
  final postCode = TextEditingController();
  final notes = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Package? package;
  int pageIndex = 0;
  var name;
  var address;
  int? currentIndex;
  bool checkBoxValue = false;
  String? price;

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
    if (value == 2) {
      fetchPrice();
    }
  }

  void back() {
    if (pageIndex > 0) {
      onPageChanged(pageIndex - 1);
    } else {
      Get.back();
    }
  }

  Future<void> fetchPrice() async {
    try {
      package = Package(
        packageName: packageName.text,
        isFragile: checkBoxValue,
        date: date.toIso8601String(),
        note: notes.text,
        sender: PackageUser(
          name: user.fullName,
          address: origin.formattedAddress,
          phone: user.phone,
        ),
        receiver: PackageUser(
          name: recipientName.text,
          address: destination.formattedAddress,
          phone: recipientPhone.text,
          postCode: postCode.text,
        ),
        origin: PackageLocation(
          long: origin.lng,
          lat: origin.lat,
          address: origin.formattedAddress,
        ),
        destination: PackageLocation(
          long: destination.lng,
          lat: destination.lat,
          address: destination.formattedAddress,
        ),
      );
      setBusy(true);
      await _activityRepo.fetchPrice(package!);
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);

  Future<void> createOrder() async {
    try {
      package = package!..price = price;
      //  await _activityRepo.createOrder(package!);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }
}
