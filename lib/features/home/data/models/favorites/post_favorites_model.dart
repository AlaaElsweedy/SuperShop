import '../../../domain/entities/favorites/post_favorite_products.dart';

import 'post_favorites_data_model.dart';

class PostFavoritesModel extends PostFavoriteProducts {
  const PostFavoritesModel({
    required super.status,
    required super.message,
    required super.favoritesData,
  });

  factory PostFavoritesModel.fromJson(Map<String, dynamic> json) {
    return PostFavoritesModel(
      status: json['status'],
      message: json['message'],
      favoritesData: PostFavoritesDataModel.fromJson(json['data']),
    );
  }
}
