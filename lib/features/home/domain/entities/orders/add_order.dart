import 'package:equatable/equatable.dart';

import 'add_order_data.dart';

class AddOrder extends Equatable {
  final bool status;
  final String message;
  final AddOrderData addOrderData;

  const AddOrder({
    required this.status,
    required this.message,
    required this.addOrderData,
  });

  @override
  List<Object> get props => [status, message, addOrderData];
}
