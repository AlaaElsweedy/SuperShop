part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.userLoginEvent(
    final String email,
    final String password,
  ) = UserSignInEvent;
}
