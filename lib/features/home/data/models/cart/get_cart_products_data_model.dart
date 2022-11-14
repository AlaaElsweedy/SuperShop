import '../../../domain/entities/cart/get_cart_products_data.dart';

class GetCartProductsDataModel extends GetCartProductsData {
  const GetCartProductsDataModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });

  factory GetCartProductsDataModel.fromJson(Map<String, dynamic> json) {
    return GetCartProductsDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: json['images'].cast<String>(),
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}
