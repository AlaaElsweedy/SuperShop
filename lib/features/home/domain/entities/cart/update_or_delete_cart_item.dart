import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/cart/update_or_delete_cart_items_data.dart';

class UpdateOrDeleteCartItem extends Equatable {
  final int id;
  final int quantity;
  final UpdateOrDeleteCartItemsData product;
  const UpdateOrDeleteCartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });

  @override
  List<Object> get props => [id, quantity, product];
}
