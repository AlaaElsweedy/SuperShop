import 'package:supershop/features/home/data/models/cart/get_cart_model.dart';
import 'package:supershop/features/home/domain/entities/cart/get_cart_products.dart';

class GetCartProductsModel extends GetCartProducts {
  const GetCartProductsModel({
    required super.status,
    required super.getCart,
  });

  factory GetCartProductsModel.fromJson(Map<String, dynamic> json) {
    return GetCartProductsModel(
      status: json['status'],
      getCart: GetCartModel.fromJson(json['data']),
    );
  }
}
