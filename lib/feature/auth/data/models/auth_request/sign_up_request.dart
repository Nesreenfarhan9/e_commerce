class SignUpRequest {
  final String name;
  final String email;
  final String password;
  final String repassword;
  final String? phone;

  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.repassword,
    this.phone,
  });
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'rePassword': repassword,
    'phone': phone,
  };
}
