import 'package:postbird/Screens/Home3.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/constants/storage_keys.dart';

class LoginController extends BaseController {
  final _authRepository = Get.find<IAuthRepository>();
  final _storageService = Get.find<IStorageService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgotPasswordCont = TextEditingController();
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
      await _storageService.secureSave(
          StorageKeys.storedEmail, emailController.text);
      await _storageService.secureSave(
          StorageKeys.storedPassword, passwordController.text);
      Get.offAll(() => NavBar());
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  Future<void> resetPassword() async {
    try {
      setBusy(true);
      await _authRepository.forgotPassword(forgotPasswordCont.text);
      setBusy(false);
      forgotPasswordCont.clear();
      Get.back();
      MySnackBar.success(
          "Password Reset Successful. A mail has been sent to ${forgotPasswordCont.text}.");
    } catch (e) {
      setBusy(false);
      MySnackBar.failure("Password Reset Failed. ${e.toString()}");
    }
  }
}
