import 'package:equatable/equatable.dart';

class AddOrderData extends Equatable {
  final String paymentMethod;
  final dynamic cost;
  final double vat;
  final int discount;
  final dynamic total;
  final int id;

  const AddOrderData({
    required this.paymentMethod,
    required this.cost,
    required this.vat,
    required this.discount,
    required this.total,
    required this.id,
  });

  @override
  List<Object> get props {
    return [
      paymentMethod,
      cost,
      vat,
      discount,
      total,
      id,
    ];
  }
}
