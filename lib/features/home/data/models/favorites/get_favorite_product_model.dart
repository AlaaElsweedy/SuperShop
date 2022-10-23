import 'package:supershop/features/home/domain/entities/favorites/get_favorite_product_data.dart';

class FavoriteProductModel extends GetFavoriteProductData {
  const FavoriteProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
    );
  }
}
