import 'add_cart_product_model.dart';
import '../../../domain/entities/cart/add_cart_product.dart';

class AddCartProductsModel extends AddCartProduct {
  const AddCartProductsModel({
    required super.status,
    required super.message,
    required super.cartData,
  });

  factory AddCartProductsModel.fromJson(Map<String, dynamic> json) {
    return AddCartProductsModel(
      status: json['status'],
      message: json['message'],
      cartData: AddCartProductModel.fromJson(json['data']),
    );
  }
}
