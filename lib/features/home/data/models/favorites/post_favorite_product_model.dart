import 'package:supershop/features/home/domain/entities/favorites/post_favorite_product_data.dart';

class PostFavoriteProductModel extends PostFavoriteProductData {
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
