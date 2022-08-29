part of 'get_favorites_bloc.dart';

@freezed
class GetFavoritesState with _$GetFavoritesState {
  const factory GetFavoritesState.loading() = LoadingState;
  const factory GetFavoritesState.success(
      GetFavoriteProducts favoriteProducts) = SuccessState;
  const factory GetFavoritesState.error(NetworkExceptions networkExceptions) =
      ErrorState;
}
