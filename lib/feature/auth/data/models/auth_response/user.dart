import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? email;
  final String? role;

  const User({this.name, this.email, this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'] as String?,
    email: json['email'] as String?,
    role: json['role'] as String?,
  );

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'role': role};

  @override
  List<Object?> get props => [name, email, role];
}
