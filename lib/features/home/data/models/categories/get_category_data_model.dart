import 'package:supershop/features/home/data/models/categories/get_category_product_data_model.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_products_data.dart';
import 'package:supershop/features/home/domain/entities/categories/get_category_product_data.dart';

class GetCategoryProductsDataModel extends GetCategoryProductsData {
  const GetCategoryProductsDataModel({required super.categoryProducts});

  factory GetCategoryProductsDataModel.fromJson(Map<String, dynamic> json) {
    return GetCategoryProductsDataModel(
      categoryProducts: List<GetCategoryProductData>.from(
        json['data'].map(
          (categoryProduct) =>
              GetCategoryProductDataModel.fromJson(categoryProduct),
        ),
      ),
    );
  }
}
