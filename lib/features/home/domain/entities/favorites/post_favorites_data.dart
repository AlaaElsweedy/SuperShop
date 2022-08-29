import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/favorites/favorite_products.dart';

class PostFavoritesData extends Equatable {
  final FavoriteProducts favoriteProducts;

  const PostFavoritesData({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
