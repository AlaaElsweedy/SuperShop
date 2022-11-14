import '../../../domain/entities/home/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.isFavorite,
    required super.isCart,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      isFavorite: json['in_favorites'],
      isCart: json['in_cart'],
    );
  }
}
