import 'get_categories_data_model.dart';
import '../../../domain/entities/categories/get_categories.dart';

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
