import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/profile/update_profile_data.dart';

class UpdateProfile extends Equatable {
  final bool status;
  final String message;
  final UpdateProfileData getProfileData;
  const UpdateProfile({
    required this.status,
    required this.message,
    required this.getProfileData,
  });

  @override
  List<Object> get props => [status, message, getProfileData];
}