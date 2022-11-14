import '../../../domain/entities/products/search_product_data.dart';
import '../../../domain/entities/products/search_products.dart';
import 'search_product_data_model.dart';

class SearchProductsModel extends SearchProducts {
  const SearchProductsModel({required super.searchProducts});

  factory SearchProductsModel.fromJson(Map<String, dynamic> json) {
    return SearchProductsModel(
      searchProducts: List<SearchProductData>.from(
        json['data'].map(
          (product) => SearchProductDataModel.fromJson(product),
        ),
      ),
    );
  }
}
