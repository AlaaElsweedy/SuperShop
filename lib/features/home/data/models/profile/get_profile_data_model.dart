import '../../../domain/entities/profile/get_profile_data.dart';

class GetProfileDataModel extends GetOrUpdateProfileData {
  const GetProfileDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.token,
  });

  factory GetProfileDataModel.fromJson(Map<String, dynamic> json) {
    return GetProfileDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      token: json['token'],
    );
  }
}
