import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/cart/add_cart_product_data.dart';

class AddCartProductInfo extends Equatable {
  final int id;
  final int quantity;
  final AddCartProductData cartProduct;

  const AddCartProductInfo({
    required this.id,
    required this.quantity,
    required this.cartProduct,
  });

  @override
  List<Object> get props => [id, quantity, cartProduct];
}
