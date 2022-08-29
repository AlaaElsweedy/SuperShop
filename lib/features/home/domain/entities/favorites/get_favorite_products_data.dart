import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/favorites/get_favorites.dart';

class GetFavoriteProductsData extends Equatable {
  final List<GetFavorites> favoritesData;

  const GetFavoriteProductsData({
    required this.favoritesData,
  });

  @override
  List<Object> get props => [favoritesData];
}
