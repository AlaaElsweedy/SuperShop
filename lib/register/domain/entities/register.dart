import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final bool status;
  final String message;
  final RegisterData registerData;

  const Register({
    required this.status,
    required this.message,
    required this.registerData,
  });

  @override
  List<Object> get props => [status, message, registerData];
}

class RegisterData extends Equatable {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  const RegisterData({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      id: json['id'],
      image: json['image'],
      token: json['token'],
    );
  }

  @override
  List<Object> get props {
    return [
      name,
      phone,
      email,
      id,
      image,
      token,
    ];
  }
}
