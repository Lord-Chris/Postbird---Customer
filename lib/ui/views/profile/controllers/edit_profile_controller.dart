import 'package:postbird/core/index.dart';

class EditProfileController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final _mediaService = Get.find<IMediaService>();
  final _authRepository = Get.find<IAuthRepository>();
  late final name;
  late final email;
  late final phone;
  late final address;
  late final newPassword;
  late final confirmPassword;
  late final currentPassword;

  File? tempImage;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController(text: user.fullName);
    email = TextEditingController(text: user.email);
    phone = TextEditingController(text: user.phone);
    address = TextEditingController(text: user.address);
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    currentPassword = TextEditingController();
  }

  bool obsureText = true;

  void toggleObscurity() {
    obsureText = !obsureText;
    update();
  }

  Future<void> selectImage(bool fromGallery) async {
    tempImage = await _mediaService.getImage(fromGallery: fromGallery);
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

  Future<void> updateProfile() async {
    try {
      if (user.fullName == name.text &&
          user.email == email.text &&
          user.phone == phone.text &&
          user.address == address.text) {
        MySnackBar.failure('Profile has no changes');
        return;
      }
      User _user = User.update(
        fullName: name.text,
        email: email.text,
        phone: phone.text,
        address: address.text,
      );
      setBusy(true);
      await _authRepository.updateProfile(_user);
      setBusy(false);
      clearTextControllers();
      MySnackBar.success("Profile update successful!");
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
    name.dispose();
    email.dispose();
    phone.dispose();
    address.dispose();
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  User get user => User.fromJson(_storageService.getMap(StorageKeys.userData)!);
}
