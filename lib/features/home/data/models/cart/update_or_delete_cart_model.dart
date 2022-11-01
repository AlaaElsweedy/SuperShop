import 'package:supershop/features/home/data/models/cart/update_or_delete_cart_item_model.dart';
import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart.dart';

class UpdateOrDeleteCartModel extends UpdateOrDeleteCart {
  const UpdateOrDeleteCartModel({
    required super.updateCartData,
    required super.subTotal,
    required super.total,
  });

  factory UpdateOrDeleteCartModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrDeleteCartModel(
      updateCartData: UpdateOrDeleteCartItemModel.fromJson(json['cart']),
      subTotal: json['sub_total'],
      total: json['total'],
    );
  }
}
