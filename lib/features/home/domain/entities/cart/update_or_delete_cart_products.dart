import 'package:equatable/equatable.dart';

import 'update_or_delete_cart.dart';

class UpdateOrDeleteCartProducts extends Equatable {
  final bool status;
  final String message;
  final UpdateOrDeleteCart updateCart;
  const UpdateOrDeleteCartProducts({
    required this.status,
    required this.message,
    required this.updateCart,
  });

  @override
  List<Object> get props => [status, message, updateCart];
}
