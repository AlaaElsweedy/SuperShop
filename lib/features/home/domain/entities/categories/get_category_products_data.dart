import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/categories/get_category_product_data.dart';

class GetCategoryProductsData extends Equatable {
  final List<GetCategoryProductData> categoryProducts;

  const GetCategoryProductsData({required this.categoryProducts});

  @override
  List<Object> get props => [categoryProducts];
}
