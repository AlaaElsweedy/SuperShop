import 'package:equatable/equatable.dart';

import 'get_categories_data.dart';

class GetCategories extends Equatable {
  final bool status;
  final GetCategoriesData data;

  const GetCategories({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
