import 'package:supershop/features/home/data/models/favorites/get_favorites_model.dart';
import 'package:supershop/features/home/domain/entities/favorites/get_favorites.dart';

class GetFavoriteProductsDataModel extends GetFavorites {
  const GetFavoriteProductsDataModel({
    required super.favoritesData,
  });

  factory GetFavoriteProductsDataModel.fromJson(Map<String, dynamic> json) {
    return GetFavoriteProductsDataModel(
      favoritesData: List<GetFavoritesModel>.from(
        (json['data'] as List).map(
          (product) => GetFavoritesModel.fromJson(product),
        ),
      ),
    );
  }
}
