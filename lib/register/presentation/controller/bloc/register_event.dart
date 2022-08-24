part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.userSignUpEvent(
    final String email,
    final String name,
    final String password,
    final String phone,
  ) = UserSignUpEvent;
}
