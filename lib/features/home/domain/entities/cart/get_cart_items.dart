import 'package:equatable/equatable.dart';

import 'get_cart_products_data.dart';

class GetCartItems extends Equatable {
  final int id;
  final int quantity;
  final GetCartProductsData getCartProduct;

  const GetCartItems({
    required this.id,
    required this.quantity,
    required this.getCartProduct,
  });

  @override
  List<Object> get props => [id, quantity, getCartProduct];
}
