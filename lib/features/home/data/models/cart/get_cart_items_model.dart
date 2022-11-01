import 'package:supershop/features/home/data/models/cart/get_cart_products_data_model.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_items.dart';

class GetCartItemsModel extends GetCartItems {
  const GetCartItemsModel({
    required super.id,
    required super.quantity,
    required super.getCartProduct,
  });

  factory GetCartItemsModel.fromJson(Map<String, dynamic> json) {
    return GetCartItemsModel(
      id: json['id'],
      quantity: json['quantity'],
      getCartProduct: GetCartProductsDataModel.fromJson(json['product']),
    );
  }
}
