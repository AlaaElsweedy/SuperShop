import 'update_profile_data_model.dart';
import '../../../domain/entities/profile/update_profile.dart';

class UpdateProfileModel extends UpdateProfile {
  const UpdateProfileModel({
    required super.status,
    required super.message,
    required super.getProfileData,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      status: json['status'],
      message: json['message'],
      getProfileData: UpdateProfileDataModel.fromJson(json['data']),
    );
  }
}
