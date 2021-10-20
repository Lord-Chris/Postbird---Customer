import 'package:postbird/core/index.dart';

abstract class IAuthRepository {
  Future<void> verifyPhone(String number);
  Future<void> verifyOTP(String number, String otp);
  Future<void> registerUser(User user);
  Future<User> loginUser(String email, String password);
  Future<void> updatePassword(String oldPass, String newPass);
  Future<void> updateProfile(User user, [File? pic]);
  Future<void> forgotPassword(String email);
  Future<void> logOut();
}
