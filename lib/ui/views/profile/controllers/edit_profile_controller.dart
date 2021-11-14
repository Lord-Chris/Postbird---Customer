import 'package:postbird/core/index.dart';

class EditProfileController extends BaseController with Validator {
  final _storageService = Get.find<IStorageService>();
  final _mediaService = Get.find<IMediaService>();
  final _authRepository = Get.find<IAuthRepository>();
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController phone;
  late final TextEditingController address;
  late final TextEditingController newPassword;
  late final TextEditingController confirmPassword;
  late final TextEditingController currentPassword;

  File? tempImage;
  String phoneVal = '';

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController(text: user.fullName);
    email = TextEditingController(text: user.email);
    phone = TextEditingController(text: user.phone.substring(4));
    address = TextEditingController(text: user.address);
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    currentPassword = TextEditingController();
    phoneVal = user.phone;
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
          user.phone == phoneVal &&
          user.address == address.text &&
          tempImage == null) {
        MySnackBar.failure('Profile has no changes');
        return;
      }
      setBusy(true);
      if (!(user.fullName == name.text &&
          user.email == email.text &&
          user.phone == phone.text &&
          user.address == address.text)) {
        User _user = User.update(
          fullName: name.text,
          email: email.text,
          phone: phoneVal,
          address: address.text,
        );
        print(phoneVal);
        await _authRepository.updateProfile(_user);
      }
      if (tempImage != null) {
        await _authRepository.updateProfilePic(tempImage!);
      }
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
