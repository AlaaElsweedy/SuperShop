import 'package:equatable/equatable.dart';

import 'get_category_data.dart';

class GetCategoriesData extends Equatable {
  final List<GetCategoryData> products;

  const GetCategoriesData({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
