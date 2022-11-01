import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_item.dart';

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
