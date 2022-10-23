import 'package:supershop/features/home/data/models/favorites/get_favorite_product_model.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorite_product.dart';

class GetFavoritesModel extends GetFavoriteProduct {
  const GetFavoritesModel({
    required super.favoriteProducts,
  });

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      favoriteProducts: FavoriteProductModel.fromJson(json['product']),
    );
  }
}
