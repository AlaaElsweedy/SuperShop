import 'package:supershop/features/home/data/models/profile/change_password_data_model.dart';
import 'package:supershop/features/home/domain/entities/profile/change_password.dart';

class ChangePasswordModel extends ChangePassword {
  const ChangePasswordModel({
    required super.status,
    required super.message,
    required super.changePasswordData,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'],
      message: json['message'],
      changePasswordData: ChangePasswordDataModel.fromJson(json['data']),
    );
  }
}
