part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final Register? movieDetail;
  final RequestState registerState;
  final NetworkExceptions? networkExceptions;

  const RegisterState({
    this.movieDetail,
    this.registerState = RequestState.isLoading,
    this.networkExceptions,
  });

  @override
  List<Object?> get props => [movieDetail, registerState, networkExceptions];

  RegisterState copyWith({
    Register? movieDetail,
    RequestState? registerState,
    NetworkExceptions? networkExceptions,
  }) {
    return RegisterState(
      movieDetail: movieDetail ?? this.movieDetail,
      registerState: registerState ?? this.registerState,
      networkExceptions: networkExceptions ?? this.networkExceptions,
    );
  }
}

// @freezed
// class RegisterState with _$RegisterState {
//   const factory RegisterState.initial() = InitialState;
//   const factory RegisterState.loading() = LoadingState;
//   const factory RegisterState.success(Register register) = SuccessState;
//   const factory RegisterState.error(NetworkExceptions networkExceptions) =
//       ErrorState;
// }
