import 'package:supershop/features/home/domain/entities/profile/update_profile_data.dart';

class UpdateProfileDataModel extends UpdateProfileData {
  const UpdateProfileDataModel({
    required super.name,
    required super.email,
    required super.phone,
  });

  factory UpdateProfileDataModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileDataModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
