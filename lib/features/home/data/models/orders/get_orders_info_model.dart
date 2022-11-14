import 'get_orders_data_model.dart';
import '../../../domain/entities/orders/get_orders_info.dart';

class GetOrdersInfoModel extends GetOrdersInfo {
  const GetOrdersInfoModel({required super.getOrdersData});

  factory GetOrdersInfoModel.fromJson(Map<String, dynamic> json) {
    return GetOrdersInfoModel(
      getOrdersData: List<GetOrdersDataModel>.from(
        json['data'].map(
          (order) => GetOrdersDataModel.fromJson(order),
        ),
      ),
    );
  }
}
