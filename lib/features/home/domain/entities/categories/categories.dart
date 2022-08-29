import 'package:equatable/equatable.dart';
import 'package:supershop/features/home/domain/entities/categories/categories_data.dart';

class Categories extends Equatable {
  final bool status;
  final CategoriesData data;

  const Categories({
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props => [status, data];
}
