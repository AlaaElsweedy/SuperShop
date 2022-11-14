import '../../../domain/entities/cart/update_or_delete_cart_products.dart';
import 'update_or_delete_cart_model.dart';

class UpdateOrDeleteCartProductsModel extends UpdateOrDeleteCartProducts {
  const UpdateOrDeleteCartProductsModel({
    required super.status,
    required super.message,
    required super.updateCart,
  });

  factory UpdateOrDeleteCartProductsModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrDeleteCartProductsModel(
      status: json['status'],
      message: json['message'],
      updateCart: UpdateOrDeleteCartModel.fromJson(json['data']),
    );
  }
}
