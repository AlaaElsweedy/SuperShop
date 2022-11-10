part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final GetProfile? getProfile;
  final RequestState getProfileState;
  final NetworkExceptions? getProfileErrorMessage;
  final UpdateProfile? updateProfile;
  final RequestState? updateProfileState;
  final NetworkExceptions? updateProfileErrorMessage;
  final SignOut? signOut;
  final RequestState? signOutState;
  final NetworkExceptions? signOutErrorMessage;
  final ChangePassword? changePassword;
  final RequestState? changePasswordState;
  final NetworkExceptions? changePasswordErrorMessage;

  const ProfileState({
    this.getProfile,
    this.getProfileState = RequestState.isLoading,
    this.getProfileErrorMessage,
    this.updateProfile,
    this.updateProfileState,
    this.updateProfileErrorMessage,
    this.signOut,
    this.signOutState,
    this.signOutErrorMessage,
    this.changePassword,
    this.changePasswordState,
    this.changePasswordErrorMessage,
  });

  ProfileState copyWith({
    GetProfile? getProfile,
    RequestState? getProfileState,
    NetworkExceptions? getProfileErrorMessage,
    UpdateProfile? updateProfile,
    RequestState? updateProfileState,
    NetworkExceptions? updateProfileErrorMessage,
    SignOut? signOut,
    RequestState? signOutState,
    NetworkExceptions? signOutErrorMessage,
    ChangePassword? changePassword,
    RequestState? changePasswordState,
    NetworkExceptions? changePasswordErrorMessage,
  }) {
    return ProfileState(
      getProfile: getProfile ?? this.getProfile,
      getProfileState: getProfileState ?? this.getProfileState,
      getProfileErrorMessage:
          getProfileErrorMessage ?? this.getProfileErrorMessage,
      updateProfile: updateProfile ?? this.updateProfile,
      updateProfileState: updateProfileState ?? this.updateProfileState,
      updateProfileErrorMessage:
          updateProfileErrorMessage ?? this.updateProfileErrorMessage,
      signOut: signOut ?? this.signOut,
      signOutState: signOutState ?? this.signOutState,
      signOutErrorMessage: signOutErrorMessage ?? this.signOutErrorMessage,
      changePassword: changePassword ?? this.changePassword,
      changePasswordState: changePasswordState ?? this.changePasswordState,
      changePasswordErrorMessage:
          changePasswordErrorMessage ?? this.changePasswordErrorMessage,
    );
  }

  @override
  List<Object?> get props {
    return [
      getProfile,
      getProfileState,
      getProfileErrorMessage,
      updateProfile,
      updateProfileState,
      updateProfileErrorMessage,
      signOut,
      signOutState,
      signOutErrorMessage,
      changePassword,
      changePasswordState,
      changePasswordErrorMessage,
    ];
  }
}
