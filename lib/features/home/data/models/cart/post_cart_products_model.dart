import 'package:supershop/features/home/data/models/cart/post_cart_product_model.dart';
import 'package:supershop/features/home/domain/entities/cart/post_cart_product.dart';

class PostCartProductsModel extends PostCartProduct {
  const PostCartProductsModel({
    required super.status,
    required super.message,
    required super.cartData,
  });

  factory PostCartProductsModel.fromJson(Map<String, dynamic> json) {
    return PostCartProductsModel(
      status: json['status'],
      message: json['message'],
      cartData: PostCartProductModel.fromJson(json['data']),
    );
  }
}
