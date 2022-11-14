import 'get_cart_items_model.dart';
import '../../../domain/entities/cart/get_cart.dart';
import '../../../domain/entities/cart/get_cart_items.dart';

class GetCartModel extends GetCart {
  const GetCartModel({
    required super.getCartItems,
    required super.totalPrice,
    required super.subTotalPrice,
  });

  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      getCartItems: List<GetCartItems>.from(
        json['cart_items'].map(
          (item) => GetCartItemsModel.fromJson(item),
        ),
      ),
      totalPrice: json['total'],
      subTotalPrice: json['sub_total'],
    );
  }
}
