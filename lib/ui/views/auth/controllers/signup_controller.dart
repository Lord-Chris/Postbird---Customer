import 'package:postbird/core/index.dart';
import 'package:postbird/ui/views/auth/views/login.dart';
import 'package:postbird/ui/views/startup/view/onboarding.dart';
import '../views/verify_otp.dart';
import '../views/signup.dart';

class SignUpController extends BaseController with Validator {
  final _authRepository = Get.find<IAuthRepository>();
  final _storageService = Get.find<IStorageService>();
  final phoneController = TextEditingController();
  final name = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final otp = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String phone = '';
  Timer? timer;
  int remainingTime = 60;
  bool obscureText = true;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(oneSec, (timer) {
      if (remainingTime == 0) {
        update();
        timer.cancel();
      } else {
        update();
        remainingTime--;
      }
    });
  }

  void toggleObscurity() {
    obscureText = !obscureText;
    update();
  }

  Future<void> onVerifyPhone([bool navigate = true]) async {
    try {
      setBusy(true);
      print(phone);
      await _authRepository.verifyPhone(phone);
      if (navigate) Get.to(() => VerifyOtp());
      startTimer();
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  Future<void> onVerifyOtp() async {
    try {
      setBusy(true);
      await _authRepository.verifyOTP(phone, otp.text);
      Get.off(() => SignUp());
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }

  Future<void> onSignUpTap() async {
    try {
      User user = User.register(
          fullName: name.text,
          username: username.text,
          email: email.text,
          phone: phone,
          password: password.text);
      setBusy(true);
      await _authRepository.registerUser(user);
      Get.offAll(() => Onboarding());
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      MySnackBar.failure(e.toString());
    }
  }
}
