import 'package:postbird/core/index.dart';

class SecurityController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final _authRepository = Get.find<IAuthRepository>();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final currentPassword = TextEditingController();

  bool obsureText = true;

  void toggleObscurity() {
    obsureText = !obsureText;
    update();
  }
  
  Future<void> updatePassword() async {
    try {
      setBusy(true);
      await _authRepository.updatePassword(
          currentPassword.text, newPassword.text);
      setBusy(false);
      clearTextControllers();
      MySnackBar.success("Password update successful!");
    } catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  void clearTextControllers() {
    currentPassword.clear();
    newPassword.clear();
    confirmPassword.clear();
  }

  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
