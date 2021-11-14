import 'package:postbird/core/index.dart';
import 'package:postbird/ui/constants/storage_keys.dart';
import 'package:postbird/ui/views/main_view/main_view.dart';

class LoginController extends BaseController {
  final _authRepository = Get.find<IAuthRepository>();
  final _storageService = Get.find<IStorageService>();
  final _biometricsService = Get.find<IBiometricsService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController forgotPasswordCont = TextEditingController();
  bool obsureText = true;
  late String? _email, _password;

  void toggleObscurity() {
    obsureText = !obsureText;
    update();
  }

  Future<void> fingerprintSignIn() async {
    try {
      bool res = await _biometricsService.scanFinger();
      if (res) {
        _email = await _storageService.secureGet(StorageKeys.storedEmail);
        _password = await _storageService.secureGet(StorageKeys.storedPassword);
        final user = await _authRepository.loginUser(_email!, _password!);
        await _storageService.saveMap(StorageKeys.userData, user.toJson());
        Get.offAll(() => MainView());
      }
    } catch (e) {
      MySnackBar.failure(e.toString());
    }
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
      Get.offAll(() => MainView());
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

  bool get showFingerPrintButton => _biometricsService.scanisAvailable;
}
