import 'package:supershop/features/home/domain/entities/cart/post_cart_product_data.dart';

class PostCartProductDataModel extends PostCartProductData {
  const PostCartProductDataModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
  });

  factory PostCartProductDataModel.fromJson(Map<String, dynamic> json) {
    return PostCartProductDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
    );
  }
}
