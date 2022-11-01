part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final GetOrUpdateProfile? getProfile;
  final RequestState getProfileState;
  final NetworkExceptions? getProfileErrorMessage;
  const ProfileState({
    this.getProfile,
    this.getProfileState = RequestState.isLoading,
    this.getProfileErrorMessage,
  });
  // final UpdateProfile? updateProfile;
  // final RequestState updateProfileState;
  // final NetworkExceptions? updateProfileErrorMessage;

  @override
  List<Object?> get props =>
      [getProfile, getProfileState, getProfileErrorMessage];
}
