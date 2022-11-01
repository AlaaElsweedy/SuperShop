import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/profile/get_or_update_profile_data.dart';

class GetOrUpdateProfile extends Equatable {
  final bool status;
  final String? message;
  final GetOrUpdateProfileData getProfileData;
  const GetOrUpdateProfile({
    required this.status,
    this.message,
    required this.getProfileData,
  });

  @override
  List<Object?> get props => [status, message, getProfileData];
}
