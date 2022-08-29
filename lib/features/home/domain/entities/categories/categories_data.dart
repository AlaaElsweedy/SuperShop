import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/categories/categories_product_data.dart';

class CategoriesData extends Equatable {
  final List<CategoriesProductData> products;

  const CategoriesData({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
