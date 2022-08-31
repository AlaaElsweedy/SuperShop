import 'package:supershop/features/home/domain/entities/favorites/post_favorite_product.dart';

class PostFavoriteProductModel extends PostFavoriteProduct {
  const PostFavoriteProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory PostFavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return PostFavoriteProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
