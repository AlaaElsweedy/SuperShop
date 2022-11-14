import '../../../domain/entities/orders/add_order.dart';
import 'add_order_data_model.dart';

class AddOrderModel extends AddOrder {
  const AddOrderModel({
    required super.status,
    required super.message,
    required super.addOrderData,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) {
    return AddOrderModel(
      status: json['status'],
      message: json['message'],
      addOrderData: AddOrderDataModel.fromJson(json['data']),
    );
  }
}
