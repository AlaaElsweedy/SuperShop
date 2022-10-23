import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/favorites/get_favorite_product.dart';

class GetFavorites extends Equatable {
  final List<GetFavoriteProduct> favoritesData;

  const GetFavorites({
    required this.favoritesData,
  });

  @override
  List<Object> get props => [favoritesData];
}
