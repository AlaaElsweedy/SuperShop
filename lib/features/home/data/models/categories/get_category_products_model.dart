import 'package:supershop/features/home/data/models/categories/get_category_data_model.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_products.dart';

class GetCategoryProductsModel extends GetCategoryProducts {
  const GetCategoryProductsModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory GetCategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryProductsModel(
      status: json['status'],
      message: json['message'],
      data: GetCategoryProductsDataModel.fromJson(json['data']),
    );
  }
}
