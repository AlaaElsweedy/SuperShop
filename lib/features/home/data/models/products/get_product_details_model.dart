import 'package:supershop/features/home/data/models/products/get_product_details_data_model.dart';
import 'package:supershop/features/home/domain/entities/products/get_product_details.dart';

class GetProductDetailsModel extends GetProductDetails {
  const GetProductDetailsModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory GetProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return GetProductDetailsModel(
      status: json['status'],
      message: json['message'],
      data: GetProductDetailsDataModel.fromJson(json['data']),
    );
  }
}
