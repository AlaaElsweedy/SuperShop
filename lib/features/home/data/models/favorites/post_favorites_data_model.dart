import 'package:supershop/features/home/data/models/favorites/post_favorite_product_model.dart';
import 'package:supershop/features/home/domain/entities/favorites/post_favorite_product.dart';

class PostFavoritesDataModel extends PostFavoriteProduct {
  const PostFavoritesDataModel({
    required super.favoriteProducts,
  });

  factory PostFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return PostFavoritesDataModel(
      favoriteProducts: PostFavoriteProductModel.fromJson(json['product']),
    );
  }
}
