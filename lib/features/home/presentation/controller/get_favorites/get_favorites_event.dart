part of 'get_favorites_bloc.dart';

@freezed
class GetFavoritesEvent with _$GetFavoritesEvent {
  const factory GetFavoritesEvent.getFavoriteProducts() =
      GetFavoriteProductsEvent;
}
