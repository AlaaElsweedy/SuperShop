part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final GetProfile? getProfile;
  final RequestState getProfileState;
  final NetworkExceptions? getProfileErrorMessage;
  final UpdateProfile? updateProfile;
  final RequestState? updateProfileState;
  final NetworkExceptions? updateProfileErrorMessage;

  const ProfileState({
    this.getProfile,
    this.getProfileState = RequestState.isLoading,
    this.getProfileErrorMessage,
    this.updateProfile,
    this.updateProfileState,
    this.updateProfileErrorMessage,
  });

  @override
  List<Object?> get props {
    return [
      getProfile,
      getProfileState,
      getProfileErrorMessage,
      updateProfile,
      updateProfileState,
      updateProfileErrorMessage,
    ];
  }

  

  ProfileState copyWith({
    GetProfile? getProfile,
    RequestState? getProfileState,
    NetworkExceptions? getProfileErrorMessage,
    UpdateProfile? updateProfile,
    RequestState? updateProfileState,
    NetworkExceptions? updateProfileErrorMessage,
  }) {
    return ProfileState(
      getProfile: getProfile ?? this.getProfile,
      getProfileState: getProfileState ?? this.getProfileState,
      getProfileErrorMessage: getProfileErrorMessage ?? this.getProfileErrorMessage,
      updateProfile: updateProfile ?? this.updateProfile,
      updateProfileState: updateProfileState ?? this.updateProfileState,
      updateProfileErrorMessage: updateProfileErrorMessage ?? this.updateProfileErrorMessage,
    );
  }
}
