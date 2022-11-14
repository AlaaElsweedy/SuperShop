import '../../../domain/entities/profile/get_profile.dart';
import 'get_profile_data_model.dart';

class GetProfileModel extends GetProfile {
  const GetProfileModel({
    required super.status,
    required super.getProfileData,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) {
    return GetProfileModel(
      status: json['status'],
      getProfileData: GetProfileDataModel.fromJson(json['data']),
    );
  }
}
