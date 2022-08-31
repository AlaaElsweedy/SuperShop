import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/favorites/get_favorite_product.dart';

class GetFavorites extends Equatable {
  final GetFavoriteProduct favoriteProducts;

  const GetFavorites({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
