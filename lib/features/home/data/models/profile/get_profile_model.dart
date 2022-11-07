import 'package:supershop/features/home/data/models/profile/get_profile_data_model.dart';
import 'package:supershop/features/home/domain/entities/profile/get_profile.dart';

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
