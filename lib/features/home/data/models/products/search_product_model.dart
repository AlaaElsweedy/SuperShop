import '../../../domain/entities/products/search_product.dart';
import 'search_products_model.dart';

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
