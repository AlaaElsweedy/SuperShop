import 'package:supershop/features/home/data/models/categories/get_categories_data_model.dart';
import 'package:supershop/features/home/domain/entities/categories/get_categories.dart';

class GetCategoriesModel extends GetCategories {
  const GetCategoriesModel({
    required super.status,
    required super.data,
  });

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesModel(
      status: json['status'],
      data: GetCategoriesDataModel.fromJson(json['data']),
    );
  }
}
