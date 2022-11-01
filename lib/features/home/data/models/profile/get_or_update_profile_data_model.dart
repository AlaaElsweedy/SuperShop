import 'package:supershop/features/home/domain/entities/profile/get_or_update_profile_data.dart';

class GetOrUpdateProfileDataModel extends GetOrUpdateProfileData {
  const GetOrUpdateProfileDataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.token,
  });

  factory GetOrUpdateProfileDataModel.fromJson(Map<String, dynamic> json) {
    return GetOrUpdateProfileDataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      token: json['token'],
    );
  }
}
