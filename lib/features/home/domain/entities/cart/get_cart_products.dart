import 'package:equatable/equatable.dart';

import 'get_cart.dart';

class GetCartProducts extends Equatable {
  final bool status;
  final String? message;
  final GetCart getCart;

  const GetCartProducts({
    required this.status,
    this.message,
    required this.getCart,
  });

  @override
  List<Object?> get props => [status, message, getCart];
}
