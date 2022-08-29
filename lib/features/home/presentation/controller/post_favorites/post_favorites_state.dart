part of 'post_favorites_bloc.dart';

@freezed
class PostFavoritesState with _$PostFavoritesState {
  const factory PostFavoritesState.loading() = LoadingState;
  const factory PostFavoritesState.success(PostFavorite favorite) =
      SuccessState;
  const factory PostFavoritesState.error(NetworkExceptions networkExceptions) =
      ErrorState;
}
