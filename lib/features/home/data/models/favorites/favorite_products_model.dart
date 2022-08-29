import 'package:supershop/features/home/domain/entities/favorites/favorite_products.dart';

class FavoriteProductsModel extends FavoriteProducts {
  const FavoriteProductsModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
  });

  factory FavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductsModel(
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
