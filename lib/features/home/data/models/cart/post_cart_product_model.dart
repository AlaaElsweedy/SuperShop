import 'package:supershop/features/home/data/models/cart/post_cart_product_data_model.dart';
import 'package:supershop/features/home/domain/entities/cart/post_cart_product_info.dart';

class PostCartProductModel extends PostCartProductInfo {
  const PostCartProductModel({
    required super.id,
    required super.quantity,
    required super.cartProduct,
  });

  factory PostCartProductModel.fromJson(Map<String, dynamic> json) {
    return PostCartProductModel(
      id: json['id'],
      quantity: json['quantity'],
      cartProduct: PostCartProductDataModel.fromJson(json['product']),
    );
  }
}
