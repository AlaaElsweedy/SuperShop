part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();
  @override
  List<Object> get props => [];
}

class GetFavoriteProductEvent extends FavoritesEvent {}

class AddOrRemoveFavoriteProductsEvent extends FavoritesEvent {
  final int productId;

  const AddOrRemoveFavoriteProductsEvent(this.productId);
  @override
  List<Object> get props => [productId];
}

class ChangeFavoriteStatusEvent extends FavoritesEvent {
  final int productId;
  final Map<int, bool> products;
  const ChangeFavoriteStatusEvent({
    required this.productId,
    required this.products,
  });

  @override
  List<Object> get props => [productId, products];
}
