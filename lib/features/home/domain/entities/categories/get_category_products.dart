import 'package:equatable/equatable.dart';

import 'get_category_products_data.dart';

class GetCategoryProducts extends Equatable {
  final bool status;
  final String? message;
  final GetCategoryProductsData data;

  const GetCategoryProducts({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}
