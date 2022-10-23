import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/favorites/get_favorite_product_data.dart';

class GetFavoriteProduct extends Equatable {
  final GetFavoriteProductData favoriteProducts;

  const GetFavoriteProduct({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
