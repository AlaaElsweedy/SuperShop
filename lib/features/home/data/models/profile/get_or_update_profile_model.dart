import 'package:supershop/features/home/data/models/profile/get_or_update_profile_data_model.dart';
import 'package:supershop/features/home/domain/entities/profile/get_or_update_profile.dart';

class GetOrUpdateProfileModel extends GetOrUpdateProfile {
  const GetOrUpdateProfileModel({
    required super.status,
    required super.getProfileData,
  });

  factory GetOrUpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return GetOrUpdateProfileModel(
      status: json['status'],
      getProfileData: GetOrUpdateProfileDataModel.fromJson(json['data']),
    );
  }
}
