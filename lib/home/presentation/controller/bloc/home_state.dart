part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = InitialState;
  const factory HomeState.loading() = LoadingState;
  const factory HomeState.success(Home homeData) = SuccessState;
  const factory HomeState.error(NetworkExceptions networkExceptions) =
      ErrorState;
}
