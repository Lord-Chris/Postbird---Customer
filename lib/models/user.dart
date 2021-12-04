import 'package:postbird/core/index.dart';

class User {
  int? id;
  String fullName;
  String? username;
  String email;
  String phone;
  String? password;
  String? address;
  String? profilePic;
  String? balance;

  User({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.profilePic,
    required this.balance,
  });

  User.register({
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  User.update({
    this.username,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
  });

  String? get parseBalance {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return "${format.currencySymbol} ${balance?.substring(0, balance?.indexOf("."))}";
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['mobile'],
      address: json['address'] ?? '',
      profilePic: json['profilepic'] ?? json['p'],
      balance: json['credit_balance'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': fullName,
        'username': username,
        'email': email,
        'mobile': phone,
        'address': address ?? '',
        'profilepic': profilePic,
        'credit_balance': balance,
      };

  Map<String, dynamic> toRegisterJson() => {
        'name': fullName,
        'username': username,
        'email': email,
        'mobile': phone,
        'address': address,
        'password': password,
        'password_confirmation': password,
      };
}
