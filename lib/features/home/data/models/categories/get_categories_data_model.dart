import '../../../domain/entities/categories/get_categories_data.dart';
import '../../../domain/entities/categories/get_category_data.dart';
import 'get_categories_product_data_model.dart';

class GetCategoriesDataModel extends GetCategoriesData {
  const GetCategoriesDataModel({required super.products});

  factory GetCategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return GetCategoriesDataModel(
      products: List<GetCategoryData>.from(
        (json['data'] as List).map(
          (product) => GetCategoryDataModel.fromJson(product),
        ),
      ),
    );
  }
}
