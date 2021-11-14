class ApiStrings {
  static const String base_url = 'https://api.postbird.com.ng/api/';

  //AUTH
  static const String verifyPhone = base_url + 'checknum';
  static const String verifyOtp = base_url + 'verify';
  static const String register = base_url + 'register';
  static const String login = base_url + 'login';
  static const String userData = base_url + 'userProfile';
  static const String logout = base_url + 'logout';
  static const String updatePassword = base_url + 'updatepass';
  static const String updateProfile = base_url + 'profileupdate';
  static const String updateProfilePic = base_url + 'profilepicture';
  static const String forgotPassword = "forgot/password";
  static const String fundWallet = base_url + "fundawallet";

  // Activity
  static const String priceCheck = base_url + 'metricpack';
  static const String processOrder = base_url + 'proccessorder';
  static const String fetchActivities = base_url + 'activities';
  static const String packageDetails = base_url + 'package/';
  static const String findDriver = base_url + 'finddriver/';

  // notifications
  static const String notificationDetails = base_url + "notifications/";
}
