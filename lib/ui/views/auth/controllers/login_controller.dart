import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/core/index.dart';

class LoginController extends BaseController {
  final _authRepository = Get.find<IAuthRepository>();
  final _storageService = Get.find<IStorageService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obsureText = true;

  void toggleObscurity() {
    obsureText = !obsureText;
    update();
  }

  Future<void> onLoginTap() async {
    try {
      setBusy(true);
      final user = await _authRepository.loginUser(
          emailController.text, passwordController.text);
      await _storageService.saveMap(StorageKeys.userData, user.toJson());
      Get.to(() => NavBar());
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  // Future login() async {
  // print("ongoing");
  // print(email! + "          " + password!);
  // final response =
  //     await http.post(Uri.parse(Strings.BASE_URL + 'login'), body: {
  //   "email": email,
  //   "password": password,
  // });

  // final data = jsonDecode(response.body);
  // print(data);
  // return data;
  // int value = data['value'];
  // bool success = data['success'];
  // if (success == false) {
  // loginToastfF();
  // }
  // var user = data['data'];
  // String message = data['message'];
  // String emailAPI = user['email'];
  // String fullnameAPI = user['name'];
  // String roleAPI = user['roleid'];
  // String userid = user['id'].toString();
  // String token = data['token'];

  // print(userid);
  // // if (success == true && roleAPI == '0') {
  // if (success == true) {
  //   setState(() {
  //     _loginStatus = LoginStatus.signIn;
  //     savePref(value, emailAPI, fullnameAPI, userid, token);
  //     _btnController2.success();
  //     Navigator.pushReplacement(
  //       context,
  //       new MaterialPageRoute(builder: (context) => new NavBar()),
  //     );
  //   });
  //   print(message);
  //   loginToast(message);
  // } else {
  //   print("fail");
  //   print(message);
  //   loginToastf(message);
  //   _btnController2.reset();
  // }
  // }

  // loginToast(String toast) {
  //   return Fluttertoast.showToast(
  //       msg: toast,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white);
  // }

  // loginToastf(String toast) {
  //   return Fluttertoast.showToast(
  //       msg: 'Something Wrong',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white);
  // }

  // loginToastfF() {
  //   Fluttertoast.showToast(
  //       msg: 'Check Login Details',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.TOP,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white);
  //   _btnController2.reset();
  // }

  // savePref(int value, String email, String fullname, String userid,
  //     String token) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     preferences.setInt("value", value);
  //     preferences.setString("name", fullname);
  //     preferences.setString("email", email);
  //     preferences.setString("id", userid);
  //     preferences.setString("pwd", password!);
  //     preferences.setString('token', token);
  //   });
  // }
}
