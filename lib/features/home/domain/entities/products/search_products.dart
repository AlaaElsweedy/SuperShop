import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/products/search_product_data.dart';

class SearchProducts extends Equatable {
  final List<SearchProductData> searchProducts;

  const SearchProducts({
    required this.searchProducts,
  });

  @override
  List<Object> get props => [searchProducts];
}
