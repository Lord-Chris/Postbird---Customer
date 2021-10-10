import 'package:postbird/models/user.dart';

import 'i_auth_repository.dart';

class AuthRepository extends IAuthRepository {
  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> loginUser(String email, String password) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<void> registerUser(User user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<void> verifyOTP(String number, String otp) {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhone(String number) {
    // TODO: implement verifyPhone
    throw UnimplementedError();
  }
}
