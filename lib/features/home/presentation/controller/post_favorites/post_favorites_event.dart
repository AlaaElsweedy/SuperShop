part of 'post_favorites_bloc.dart';

@freezed
class PostFavoritesEvent with _$PostFavoritesEvent {
  const factory PostFavoritesEvent.addToFavorites(String productId) =
      AddToFavoritesEvent;
}
