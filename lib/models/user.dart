class User {
  int? id;
  final String fullName;
  final String username;
  final String email;
  final String phone;
  String? password;

  User({
    required this.id,
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
      id: json['id'],
      fullName: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['mobile'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': fullName,
        'username': username,
        'email': email,
        'mobile': phone,
      };
}
