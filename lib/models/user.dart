class User {
  final String fullName;
  final String username;
  final String email;
  final String phone;
  String? password;

  User({
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
  });

  User.register({
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json[''],
      username: json[''],
      email: json[''],
      phone: json[''],
    );
  }

  // Map<String, dynamic> toJson() => {
  //       '': fullName,
  //       '': username,
  //       '': email,
  //       '': phone,
  //       '': password,
  //     };
}
