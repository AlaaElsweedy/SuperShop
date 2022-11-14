import '../../../domain/entities/orders/get_orders.dart';
import 'get_orders_info_model.dart';

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
