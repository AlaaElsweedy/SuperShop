import 'package:supershop/features/home/data/models/cart/update_or_delete_cart_items_data_model.dart';
import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_item.dart';

class UpdateOrDeleteCartItemModel extends UpdateOrDeleteCartItem {
  const UpdateOrDeleteCartItemModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  factory UpdateOrDeleteCartItemModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrDeleteCartItemModel(
      id: json['id'],
      quantity: json['quantity'],
      product: UpdateOrDeleteCartItemsDataModel.fromJson(json['product']),
    );
  }
}
