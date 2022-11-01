import 'package:equatable/equatable.dart';

class GetOrdersData extends Equatable {
  final int id;
  final dynamic totalPrice;
  final String date;
  final String status;

  const GetOrdersData({
    required this.id,
    required this.totalPrice,
    required this.date,
    required this.status,
  });

  @override
  List<Object> get props => [
        id,
        totalPrice,
        date,
        status,
      ];
}
