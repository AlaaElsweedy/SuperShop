import '../../domain/entities/register.dart';

class RegisterModel extends Register {
  const RegisterModel({
    required super.status,
    required super.message,
    required super.registerData,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status'],
      message: json['message'],
      registerData: RegisterDataModel.fromJson(json['data']),
    );
  }
}

class RegisterDataModel extends RegisterData {
  const RegisterDataModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.id,
    required super.image,
    required super.token,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      id: json['id'],
      image: json['image'],
      token: json['token'],
    );
  }
}
