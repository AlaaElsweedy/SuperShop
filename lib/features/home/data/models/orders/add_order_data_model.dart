import 'package:supershop/features/home/domain/entities/orders/add_order_data.dart';

class AddOrderDataModel extends AddOrderData {
  const AddOrderDataModel({
    required super.paymentMethod,
    required super.cost,
    required super.vat,
    required super.discount,
    required super.total,
    required super.id,
  });

  factory AddOrderDataModel.fromJson(Map<String, dynamic> json) {
    return AddOrderDataModel(
      paymentMethod: json['payment_method'],
      cost: json['cost'],
      vat: json['vat'],
      discount: json['discount'],
      total: json['total'],
      id: json['id'],
    );
  }
}
