class User {
  
  final String id;
  final String email;
  final String fullname;
  final String telephone;

  User({
    required this.id,
    required this.email,
    required this.fullname,
    required this.telephone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['datas']['id'],
      email: json['datas']['email'],
      fullname: json['datas']['fullname'],
      telephone: json['datas']['telephone'],
    );
  }
}
