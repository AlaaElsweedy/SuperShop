import '../../../domain/entities/cart/update_or_delete_cart_items_data.dart';

class UpdateOrDeleteCartItemsDataModel extends UpdateOrDeleteCartItemsData {
  const UpdateOrDeleteCartItemsDataModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory UpdateOrDeleteCartItemsDataModel.fromJson(Map<String, dynamic> json) {
    return UpdateOrDeleteCartItemsDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
