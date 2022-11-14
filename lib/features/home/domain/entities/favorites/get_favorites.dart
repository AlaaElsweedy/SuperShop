import 'package:equatable/equatable.dart';

import 'get_favorite_product.dart';

class GetFavorites extends Equatable {
  final List<GetFavoriteProduct> favoritesData;

  const GetFavorites({
    required this.favoritesData,
  });

  @override
  List<Object> get props => [favoritesData];
}
