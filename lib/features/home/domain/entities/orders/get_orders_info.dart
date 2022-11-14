import 'package:equatable/equatable.dart';

import 'get_orders_data.dart';

class GetOrdersInfo extends Equatable {
  final List<GetOrdersData> getOrdersData;
  const GetOrdersInfo({
    required this.getOrdersData,
  });

  @override
  List<Object> get props => [getOrdersData];
}
