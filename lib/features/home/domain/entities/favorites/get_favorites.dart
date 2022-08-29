import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/favorites/favorite_products.dart';

class GetFavorites extends Equatable {
  final FavoriteProducts favoriteProducts;

  const GetFavorites({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
