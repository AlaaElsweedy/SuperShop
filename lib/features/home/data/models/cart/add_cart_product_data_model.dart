import '../../../domain/entities/cart/add_cart_product_data.dart';

class AddCartProductDataModel extends AddCartProductData {
  const AddCartProductDataModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
  });

  factory AddCartProductDataModel.fromJson(Map<String, dynamic> json) {
    return AddCartProductDataModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
    );
  }
}
