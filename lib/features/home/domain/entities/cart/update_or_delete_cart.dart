import 'package:equatable/equatable.dart';

import 'update_or_delete_cart_item.dart';

class UpdateOrDeleteCart extends Equatable {
  final UpdateOrDeleteCartItem updateCartData;
  final dynamic subTotal;
  final dynamic total;
  const UpdateOrDeleteCart({
    required this.updateCartData,
    required this.subTotal,
    required this.total,
  });

  @override
  List<Object> get props => [subTotal, total];
}
