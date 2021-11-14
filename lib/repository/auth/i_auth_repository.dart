import 'package:postbird/core/index.dart';

abstract class IAuthRepository {
  Future<void> verifyPhone(String number);
  Future<void> verifyOTP(String number, String otp);
  Future<void> registerUser(User user);
  Future<User> loginUser(String email, String password);
  Future<User> fetchUserData();
  Future<void> updatePassword(String oldPass, String newPass);
  Future<void> updateProfile(User user);
  Future<void> updateProfilePic(File pic);
  Future<void> forgotPassword(String email);
  Future<void> logOut();
  Future<void> creditUser(File receipt, String creditAmount);
}
