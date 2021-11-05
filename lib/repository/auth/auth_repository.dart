import 'package:dio/dio.dart';
import 'package:postbird/core/index.dart';
import 'package:postbird/ui/constants/storage_keys.dart';

class AuthRepository extends IAuthRepository {
  final _networkService = Get.find<INetworkService>();
  final _storageService = Get.find<IStorageService>();

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final body = {"email": email};
      await _networkService.post(ApiStrings.forgotPassword, body: body);
    } catch (e) {
      throw Failure(e.toString());
    }
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
  Future<void> registerUser(User user) async {
    try {
      Map<String, dynamic> body = user.toRegisterJson();
      await _networkService.post(ApiStrings.register, body: body);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> updatePassword(String oldPass, String newPass) async {
    try {
      final body = {
        'old_password': oldPass,
        'password': newPass,
        'password_confirmation': newPass,
      };
      final headers = {"Authorization": "Bearer $token"};
      await _networkService.post(
        ApiStrings.updatePassword,
        body: body,
        headers: headers,
      );
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> updateProfile(User user) async {
    try {
      final body = FormData.fromMap(user.toJson());
      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      };
      final res = await _networkService.post(
        ApiStrings.updateProfile,
        body: body,
        headers: headers,
      );
      final _newUser = User.fromJson(res?.data['data']);
      await _storageService.saveMap(StorageKeys.userData, _newUser.toJson());
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> updateProfilePic(File pic) async {
    try {
      final body = FormData.fromMap(
        {'picture': await MultipartFile.fromFile(pic.path)},
      );
      final headers = {
        "Authorization": "Bearer $token",
        "Content-Type": "multipart/form-data"
      };
      final res = await _networkService.post(
        ApiStrings.updateProfilePic,
        body: body,
        headers: headers,
      );
      final _newUser = User.fromJson(res?.data['data']);
      await _storageService.saveMap(StorageKeys.userData, _newUser.toJson());
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  @override
  Future<void> verifyOTP(String number, String otp) async {
    try {
      final body = {"phone": number, "verification_code": otp};
      await _networkService.post(ApiStrings.verifyOtp, body: body);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
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

  @override
  Future<void> logOut() async {
    try {
      final headers = {"Authorization": "Bearer $token"};
      final body = {"token": "Bearer $token"};
      await _networkService.post(ApiStrings.logout,
          headers: headers, body: body);
    } on Failure catch (e) {
      throw e;
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }

  String? get token => _storageService.getString(StorageKeys.authToken);
}
