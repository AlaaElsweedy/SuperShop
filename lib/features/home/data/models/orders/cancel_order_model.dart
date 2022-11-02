import 'package:supershop/features/home/domain/entities/orders/cancel_orders.dart';

class CancelOrderModel extends CancelOrder {
  const CancelOrderModel({
    required super.status,
    required super.message,
  });

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) {
    return CancelOrderModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
