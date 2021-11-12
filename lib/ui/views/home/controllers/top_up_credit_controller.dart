import 'package:postbird/core/index.dart';

class TopUpCreditController extends BaseController
    with SingleGetTickerProviderMixin {
  final _mediaService = Get.find<IMediaService>();
  final _authRepo = Get.find<IAuthRepository>();
  late TabController tabCont;
  final TextEditingController amountCont = TextEditingController();
  File? receiptImage;
  int chosenIndex = -1;

  List<PayPlan> paymentPlans = [
    PayPlan(title: "Bag", credit: "1000", price: "1000", image: ""),
    PayPlan(title: "Box", credit: "2500", price: "2500", image: ""),
    PayPlan(title: "Chest", credit: "5000", price: "5000", image: ""),
  ];

  @override
  void onInit() {
    tabCont = TabController(vsync: this, length: 2);
    super.onInit();
  }

  void changeChoseIndex(int index) {
    amountCont.clear();
    chosenIndex = index;
    update();
  }

  void onPayTap() {
    if (amountCont.text.isEmpty && chosenIndex < 0)
      return MySnackBar.failure("Select an option or Input an amount.");
    chosenIndex = 1;
    tabCont.animateTo(1);
    update();
  }

  void onTextFieldChanged(String val) {
    if (val.isNotEmpty) {
      chosenIndex = -1;
      update();
    }
  }

  bool back([bool isButton = true]) {
    if (chosenIndex > 0) {
      chosenIndex = 0;
      tabCont.animateTo(0);
      update();
      return false;
    } else {
      if (isButton) {
        Get.back();
        return false;
      } else
        return true;
    }
  }

  Future<void> onSubmitTap() async {
    if (amountCont.text.isEmpty && chosenIndex < 0)
      return MySnackBar.failure("Select a payment plan.");
    if (receiptImage == null)
      return MySnackBar.failure("Upload proof of payment.");
    late final _amount;
    if (amountCont.text.isNotEmpty) {
      _amount = amountCont.text;
    } else {
      _amount = paymentPlans[chosenIndex].credit;
    }

    try {
      setBusy(true);
      await _authRepo.creditUser(receiptImage!, _amount);
      setBusy(false);
      Get.back();
      MySnackBar.success("Upload Successful, It is being verified");
    } catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  Future<void> getReceiptImage() async {
    receiptImage = await _mediaService.getImage(fromGallery: true);
    update();
  }

  @override
  void onClose() {
    tabCont.dispose();
    amountCont.dispose();
  }
}

class PayPlan {
  final String title, credit, price, image;

  PayPlan({
    required this.title,
    required this.credit,
    required this.price,
    required this.image,
  });
}
