import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/cart/post_cart_product_data.dart';

class PostCartProductInfo extends Equatable {
  final int id;
  final int quantity;
  final PostCartProductData cartProduct;

  const PostCartProductInfo({
    required this.id,
    required this.quantity,
    required this.cartProduct,
  });

  @override
  List<Object> get props => [id, quantity, cartProduct];
}
