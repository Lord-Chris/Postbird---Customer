import 'package:postbird/core/index.dart';

class OnboardingController extends GetxController {
  String? email = "", avatar = "", fullname = "", id = "";
  bool testLogin = true;

  @override
  void onInit() {
    super.onInit();
    getPref();
  }

  getPref() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // setState(() {
    //   id = preferences.getString("id")!;
    //   email = preferences.getString("email")!;
    //   fullname = preferences.getString("name")!;
    // });
    //print('email: ' + email);
    // print('ID: ' + id);
    //print('name: ' + fullname.toString());
  }
}
