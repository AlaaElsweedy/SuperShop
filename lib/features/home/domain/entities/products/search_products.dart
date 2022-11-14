import 'package:equatable/equatable.dart';

import 'search_product_data.dart';

class SearchProducts extends Equatable {
  final List<SearchProductData> searchProducts;

  const SearchProducts({
    required this.searchProducts,
  });

  @override
  List<Object> get props => [searchProducts];
}
