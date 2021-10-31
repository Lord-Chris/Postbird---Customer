import 'package:postbird/core/index.dart';

class CallService extends ICallService {
  @override
  Future<void> localCall(String number) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(number);
    } catch (e) {
      print(e.toString());
      throw Failure(e.toString());
    }
  }
}
