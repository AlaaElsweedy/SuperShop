import 'package:supershop/features/home/data/models/products/search_products_model.dart';
import 'package:supershop/features/home/domain/entities/products/search_product.dart';

class SearchProductModel extends SearchProduct {
  const SearchProductModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) {
    return SearchProductModel(
      status: json['status'],
      message: json['message'],
      data: SearchProductsModel.fromJson(json['data']),
    );
  }
}
