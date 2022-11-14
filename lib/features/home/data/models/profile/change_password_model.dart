import '../../../domain/entities/profile/change_password.dart';

class ChangePasswordModel extends ChangePassword {
  const ChangePasswordModel({
    required super.status,
    required super.message,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
