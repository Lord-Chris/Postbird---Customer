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
}
