import 'package:postbird/core/index.dart';

class AuthRepository extends IAuthRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();

  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<User> loginUser(String email, String password) async {
    try {
      Map<String, dynamic> body = {'email': email, 'password': password};
      final res = await _networkService.post(ApiStrings.login, body: body);
      await _storageService.saveString(
          StorageKeys.authToken, res!.data['token']);
      return User.fromJson(res.data['data']);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
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
  Future<void> verifyPhone(String number) async {
    try {
      final body = {"mobile": number};
      await _networkService.post(ApiStrings.verifyPhone, body: body);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }
}
