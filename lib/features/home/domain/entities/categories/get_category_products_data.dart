import 'package:equatable/equatable.dart';

import 'get_category_product_data.dart';

class GetCategoryProductsData extends Equatable {
  final List<GetCategoryProductData> categoryProducts;

  const GetCategoryProductsData({required this.categoryProducts});

  @override
  List<Object> get props => [categoryProducts];
}
