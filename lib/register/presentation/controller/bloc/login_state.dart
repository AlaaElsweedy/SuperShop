part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.success(Register register) = LoginSuccessState;
  const factory LoginState.error(NetworkExceptions networkExceptions) =
      LoginErrorState;
}
