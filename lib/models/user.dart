class User {
  int? id;
  String fullName;
  String? username;
  String email;
  String phone;
  String? password;
  String? address;
  String? profilePic;
  String? credit;

  User({
    required this.id,
    required this.fullName,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.profilePic,
    required this.credit,
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['mobile'],
      address: json['address'] ?? '',
      profilePic: json['profilepic'] ?? json['p'],
      credit: json['credit_balance'],
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
        'credit_balance': credit,
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
