import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/cart/add_cart_product_info.dart';

class AddCartProduct extends Equatable {
  final bool status;
  final String message;
  final AddCartProductInfo cartData;

  const AddCartProduct({
    required this.status,
    required this.message,
    required this.cartData,
  });

  @override
  List<Object> get props => [status, message, cartData];
}
