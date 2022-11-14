import 'package:equatable/equatable.dart';

import 'get_profile_data.dart';

class GetProfile extends Equatable {
  final bool status;
  final String? message;
  final GetOrUpdateProfileData getProfileData;
  const GetProfile({
    required this.status,
    this.message,
    required this.getProfileData,
  });

  @override
  List<Object?> get props => [status, message, getProfileData];
}
