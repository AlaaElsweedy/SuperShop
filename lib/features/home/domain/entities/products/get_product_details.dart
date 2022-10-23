import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/products/get_product_detail_data.dart';

class GetProductDetails extends Equatable {
  final bool status;
  final String? message;
  final GetProductDetailData data;

  const GetProductDetails({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}
