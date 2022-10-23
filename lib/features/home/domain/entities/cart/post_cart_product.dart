import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/cart/post_cart_product_info.dart';

class PostCartProduct extends Equatable {
  final bool status;
  final String message;
  final PostCartProductInfo cartData;

  const PostCartProduct({
    required this.status,
    required this.message,
    required this.cartData,
  });

  @override
  List<Object> get props => [status, message, cartData];
}
