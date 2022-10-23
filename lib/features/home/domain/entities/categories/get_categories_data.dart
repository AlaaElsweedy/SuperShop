import 'package:equatable/equatable.dart';

import 'package:supershop/features/home/domain/entities/categories/get_category_data.dart';

class GetCategoriesData extends Equatable {
  final List<GetCategoryData> products;

  const GetCategoriesData({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
