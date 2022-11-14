import 'package:equatable/equatable.dart';

import 'get_cart_items.dart';

class GetCart extends Equatable {
  final List<GetCartItems> getCartItems;
  final dynamic totalPrice;
  final dynamic subTotalPrice;

  const GetCart({
    required this.getCartItems,
    required this.totalPrice,
    required this.subTotalPrice,
  });

  @override
  List<Object> get props => [
        getCartItems,
        totalPrice,
        subTotalPrice,
      ];
}
