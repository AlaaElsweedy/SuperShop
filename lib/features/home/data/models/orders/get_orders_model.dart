import 'package:supershop/features/home/data/models/orders/get_orders_info_model.dart';
import 'package:supershop/features/home/domain/entities/orders/get_orders.dart';

class GetOrdersModel extends GetOrders {
  const GetOrdersModel({
    required super.status,
    required super.getOrdersInfo,
  });

  factory GetOrdersModel.fromJson(Map<String, dynamic> json) {
    return GetOrdersModel(
      status: json['status'],
      getOrdersInfo: GetOrdersInfoModel.fromJson(json['data']),
    );
  }
}
