import '../../../domain/entities/favorites/get_favorite_product.dart';
import 'get_favorite_product_model.dart';

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
