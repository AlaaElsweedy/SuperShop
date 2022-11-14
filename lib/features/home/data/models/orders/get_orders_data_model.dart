import '../../../domain/entities/orders/get_orders_data.dart';

class GetOrdersDataModel extends GetOrdersData {
  const GetOrdersDataModel({
    required super.id,
    required super.totalPrice,
    required super.date,
    required super.status,
  });

  factory GetOrdersDataModel.fromJson(Map<String, dynamic> json) {
    return GetOrdersDataModel(
      id: json['id'],
      totalPrice: json['total'],
      date: json['date'],
      status: json['status'],
    );
  }
}
