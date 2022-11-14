import 'package:equatable/equatable.dart';

import 'get_favorite_product_data.dart';

class GetFavoriteProduct extends Equatable {
  final GetFavoriteProductData favoriteProducts;

  const GetFavoriteProduct({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
