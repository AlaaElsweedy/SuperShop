import 'add_cart_product_data_model.dart';
import '../../../domain/entities/cart/add_cart_product_info.dart';

class AddCartProductModel extends AddCartProductInfo {
  const AddCartProductModel({
    required super.id,
    required super.quantity,
    required super.cartProduct,
  });

  factory AddCartProductModel.fromJson(Map<String, dynamic> json) {
    return AddCartProductModel(
      id: json['id'],
      quantity: json['quantity'],
      cartProduct: AddCartProductDataModel.fromJson(json['product']),
    );
  }
}
