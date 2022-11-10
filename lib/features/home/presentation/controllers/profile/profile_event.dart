part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final String phoneNumber;
  const UpdateProfileEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}

class SignOutEvent extends ProfileEvent {
  final String token;
  const SignOutEvent({
    required this.token,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordEvent({
    required this.currentPassword,
    required this.newPassword,
  });
}
