import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/orders/get_orders_info.dart';

class GetOrders extends Equatable {
  final bool status;
  final String? message;
  final GetOrdersInfo getOrdersInfo;
  const GetOrders({
    required this.status,
    this.message,
    required this.getOrdersInfo,
  });

  @override
  List<Object?> get props => [status, message, getOrdersInfo];
}
