part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitialState;
  const factory RegisterState.loading() = RegisterLoadingState;
  const factory RegisterState.success() = RegisterSuccessState;
  const factory RegisterState.error(NetworkExceptions networkExceptions) =
      RegisterErrorState;
}
