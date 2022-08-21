part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class UserSignInEvent extends RegisterEvent {
  final String email;
  final String password;

  const UserSignInEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class UserSignUpEvent extends RegisterEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  const UserSignUpEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [name, phone, email, password];
}


// @freezed
// class RegisterEvent with _$RegisterEvent {
//   const factory RegisterEvent.userSignUp(
//     final String email,
//     final String name,
//     final String password,
//     final String phone,
//   ) = UserSingUpEvent;

//   const factory RegisterEvent.userLogin(
//     final String email,
//     final String password,
//   ) = UserLoginEvent;
// }
