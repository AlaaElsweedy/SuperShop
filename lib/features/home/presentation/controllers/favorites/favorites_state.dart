part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final GetFavoriteProducts? getFavoriteProducts;
  final RequestState getFavoritesState;
  final NetworkExceptions? getFavoriteErrorMessage;
  final PostFavorite? addOrRemoveFavoriteProducts;
  final RequestState addOrRemoveFavoritesState;
  final NetworkExceptions? addOrRemoveFavoriteErrorMessage;

  const FavoritesState({
    this.getFavoriteProducts,
    this.getFavoritesState = RequestState.isLoading,
    this.getFavoriteErrorMessage,
    this.addOrRemoveFavoriteProducts,
    this.addOrRemoveFavoritesState = RequestState.isLoading,
    this.addOrRemoveFavoriteErrorMessage,
  });

  @override
  List<Object?> get props {
    return [
      getFavoriteProducts,
      getFavoritesState,
      getFavoriteErrorMessage,
      addOrRemoveFavoriteProducts,
      addOrRemoveFavoritesState,
      addOrRemoveFavoriteErrorMessage,
    ];
  }

  FavoritesState copyWith({
    GetFavoriteProducts? getFavoriteProducts,
    RequestState? getFavoritesState,
    NetworkExceptions? getFavoriteErrorMessage,
    PostFavorite? addOrRemoveFavoriteProducts,
    RequestState? addOrRemoveFavoritesState,
    NetworkExceptions? addOrRemoveFavoriteErrorMessage,
  }) {
    return FavoritesState(
      getFavoriteProducts: getFavoriteProducts ?? this.getFavoriteProducts,
      getFavoritesState: getFavoritesState ?? this.getFavoritesState,
      getFavoriteErrorMessage:
          getFavoriteErrorMessage ?? this.getFavoriteErrorMessage,
      addOrRemoveFavoriteProducts:
          addOrRemoveFavoriteProducts ?? this.addOrRemoveFavoriteProducts,
      addOrRemoveFavoritesState:
          addOrRemoveFavoritesState ?? this.addOrRemoveFavoritesState,
      addOrRemoveFavoriteErrorMessage: addOrRemoveFavoriteErrorMessage ??
          this.addOrRemoveFavoriteErrorMessage,
    );
  }
}

class ChangeFavoriteStatus extends FavoritesState {}
