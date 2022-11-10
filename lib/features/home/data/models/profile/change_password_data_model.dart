import 'package:supershop/features/home/domain/entities/profile/change_password_data.dart';

class ChangePasswordDataModel extends ChangePasswordData {
  const ChangePasswordDataModel({required super.email});

  factory ChangePasswordDataModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordDataModel(email: json['email']);
  }
}
